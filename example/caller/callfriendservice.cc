#include <iostream>
#include "mprpcapplication.h"
#include "friend.pb.h"

int main(int argc, char **argv)
{
    // 整个程序启动以后，想使用mprpc框架来享受rpc服务调用，
    // 一定需要先调用框架的初始化函数（只初始化一次）
    MprpcApplication::Init(argc, argv);

    // 演示调用远程发布的rpc方法的Login
    fixbug::FriendServiceRpc_Stub stub(new MprpcChannel());

    // rpc方法的请求参数
    fixbug::GetFriendsListsRequest request;
    request.set_userid(10);

    // rpc方法的响应
    fixbug::GetFriendsListsResponse response;

    // RpcChannel->RpcChannel::CallMethod
    // 集中来做所有rpc方法调用的参数序列化和网络发送
    // 发起rpc方法的调用 同步的rpc调用过程
    MprpcController controller;
    stub.GetFriendsLists(&controller, &request, &response, nullptr);

    // 一次rpc调用完成，读调用的结果
    /*
    直接读取response ，是假设request成功的，在其中不会发生错误
    这种情况是理想化的，在其中会出现很多问题
    如：网络建立连接错误 各种地方的return exit等 都会造成没有response响应
    这时候该怎么办？ controller控制信息
    */
    if (controller.Failed())
    {
        std::cout << controller.ErrorText() << std::endl;
    }
    else
    {
        if (0 == response.result().errcode())
        {
            std::cout << "rpc GetFriendsLists response success!" << std::endl;
            int size = response.friends_size();
            for (int i = 0; i < size; i++)
            {
                std::cout << "index: " << (i + 1) << " name: " << response.friends(i) << std::endl;
            }
        }
        else
        {
            std::cout << "rpc GetFriendsLists response error: " << response.result().errmsg() << std::endl;
        }
    }
}
