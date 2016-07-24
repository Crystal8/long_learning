cmake_minimum_required(VERSION 2.8)
project(client)

include_directories(../sphinxclient/)
link_directories(../../sphinxclient/)

add_executable(client client.cpp)
target_link_libraries(client sphinxclient gflags glog) 

