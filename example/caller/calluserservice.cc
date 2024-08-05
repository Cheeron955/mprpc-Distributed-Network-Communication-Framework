#include <iostream>
#include "mprpcapplication.h"
#include "user.pb.h"
#include "mprpcchannel.h"


int main(int argc,char **argv)
{
    //整个程序启动以后，想使用mprpc框架来享受rpc服务调用，
    //一定需要先调用框架的初始化函数（只初始化一次）
    MprpcApplication::Init(argc,argv);

    //演示调用远程发布的rpc方法的Login
    fixbug::UserServiceRpc_Stub stub(new MprpcChannel());

    //rpc方法的请求参数
    fixbug::LoginRequest request;
    request.set_name("zhang san");
    request.set_pwd("123456");

    //rpc方法的响应
    fixbug::LoginResponse response;

    //RpcChannel->RpcChannel::CallMethod 
    //集中来做所有rpc方法调用的参数序列化和网络发送
    //发起rpc方法的调用 同步的rpc调用过程
    MprpcController controller;
    stub.Login(&controller,&request,&response,nullptr);

    //一次rpc调用完成，读调用的结果
    if (controller.Failed())
    {
        std::cout << controller.ErrorText() << std::endl;
    }
    else
    {
        if(0==response.result().errcode())
        {
            std::cout<<"rpc login response success: "<<
                response.success()<<std::endl;
        }
        else
        {
            std::cout<<"rpc login response error: "<<
                response.result().errmsg()<<std::endl;
        }
    }

    MprpcController controller1;
    if (controller.Failed())
    {
        std::cout << controller.ErrorText() << std::endl;
    }
    else
    {
        //演示调用远程发布的rpc方法的Register
        fixbug::RegisterRequest req;
        req.set_id(200);
        req.set_name("mprpc");
        req.set_pwd("6666");
        fixbug::RegisterResponse rsp;
        stub.Register(&controller1,&req,&rsp,nullptr);

        if(0==rsp.result().errcode())
        {
            std::cout<<"Register login response success: "<<
                rsp.success()<<std::endl;
        }
        else
        {
            std::cout<<"Register login response error: "<<
                rsp.result().errmsg()<<std::endl;
        }
    }
    return 0;

}