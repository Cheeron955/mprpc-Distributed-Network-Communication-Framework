
# 查找当前目录下的所有源文件,并将名称保存到 SRC_LIST变量
# aux_source_directory只要CMakeLists文件不变，aux_source_directory就不会作用于新的文件中

# aux_source_directory(. SRC_LIST)
set(SRC_LIST 
    mprpcapplication.cc 
    mprpcconfig.cc 
    rpcheader.pb.cc 
    rpcprovider.cc 
    mprpcchannel.cc
    mprpccontroller.cc
    logger.cc
    zookeeperutil.cc)
add_library(mprpc ${SRC_LIST})

#muduo_net是网络的核心模块 要放在前面 mt是多线程版本
target_link_libraries(mprpc muduo_net muduo_base pthread zookeeper_mt)
