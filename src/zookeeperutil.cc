#include "zookeeperutil.h"
#include "mprpcapplication.h"
#include <semaphore.h>
#include <iostream>

//全局的watcher观察器 zkserver给zkclient的通知
void global_watcher(zhandle_t *zh,int type,
                        int state,const char *path,void *watcherCtx)
{
    if(type==ZOO_SESSION_EVENT)//回调的消息类型 是和会话相关的消息类型
    {
        if(state==ZOO_CONNECTED_STATE) //zkclient zkserver连接成功
        {
            //在句柄上获取信号量
            sem_t *sem=(sem_t*)zoo_get_context(zh);

            //给信号量加一
            sem_post(sem);
        }
    }
}

ZkClient::ZkClient():m_zhandle(nullptr)
{

}

ZkClient::~ZkClient()
{
    if(m_zhandle!=nullptr)
    {
        //关闭句柄,释放资源
        zookeeper_close(m_zhandle);
    }
}

void ZkClient::Start()
{
    std::string host=MprpcApplication::GetInstance().GetConfig().Load("zookeeperip");
    std::string port=MprpcApplication::GetInstance().GetConfig().Load("zookeeperport");
    std::string connstr=host+":"+port;//zk要求是这样的格式

    /**
    zookeeper_mt：多线程版本
    zookeeper的API客户端提供了三个线程
    API调用线程
    网络I/O线程 zookeeper_init底层直接调用pthread_create（底层是poll）会创建一个线程，专门发起IO操作
    watcher回调线程  当客户端接收到zkserver的响应时

     */
    //创建会话 异步的 成功只代表创建m_zhandle句柄资源成功，不代表连接成功
    //连接字符串 全局的回调 会话超时时间
    m_zhandle=zookeeper_init(connstr.c_str(),global_watcher,30000,
                    nullptr,nullptr,0);

    //发起的动作都没有产生过
    if(nullptr==m_zhandle)
    {
        std::cout<<"zookeeper_init error!"<<std::endl;
        exit(EXIT_FAILURE);
    }

    //信号量
    sem_t sem;
    sem_init(&sem,0,0);

    //像句柄资源上设置上下文
    zoo_set_context(m_zhandle,&sem);

    //阻塞等待global_watcher发送连接成功ZOO_CONNECTED_STATE的信号
    sem_wait(&sem);
    std::cout<<"zookeeper_init success!"<<std::endl;
}

//节点路径 节点数据 节点长度 节点状态（临时/永久）
void ZkClient::Create(const char *path,const char *data,
                int datalen,int state)
{
    char path_buffer[128];
    int bufferlen=sizeof(path_buffer);
    int flag;

    //判断path表示的znode节点是否存在，存在不在重复创建
    flag=zoo_exists(m_zhandle,path,0,nullptr);

    //节点不存在
    if(ZNONODE==flag)
    {
        //创建指定path的znode节点
        //state 就是底层的flags 默认是永久性节点，如果是ZOO_EPHEMERAL则为临时性
        //通过get查看节点 ephemeralOwner = 0x0就是永久性的
        flag=zoo_create(m_zhandle,path,data,datalen,
                &ZOO_OPEN_ACL_UNSAFE,state,path_buffer,bufferlen);
        if(flag==ZOK)
        {
            std::cout<<"znode create success... path"<<path<<std::endl;
        }
        else
        {
            std::cout<<"flag:"<<flag<<std::endl;
            std::cout<<"znode create error... path: "<<path<<std::endl;
            exit(EXIT_FAILURE);
        }
    }
}

//根据指定的path，获取znode节点的值
std::string ZkClient::GetData(const char *path)
{
    char buffer[64];
    int bufferlen=sizeof(buffer);

    //同步 ZOK operation completed successfully
    int flag=zoo_get(m_zhandle,path,0,buffer,&bufferlen,nullptr);
    if(flag!=ZOK)
    {
        std::cout<<"znode get error... path: "<<path<<std::endl;
        return "";
    }
    else
    {
        return buffer;
    }
}