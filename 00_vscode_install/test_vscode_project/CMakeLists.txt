
cmake_minimum_required(VERSION 3.10) 

#SET( CMAKE_C_COMPILER g++ )
#add_compile_options( -std=c++11 )
STRING( REGEX REPLACE ".*/(.*)" "\\1" CURRENT_FOLDER ${CMAKE_CURRENT_SOURCE_DIR} )
set(TARGET ${CURRENT_FOLDER})

set( CMAKE_BUILD_TYPE "Debug" )


INCLUDE_DIRECTORIES( C:/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++ )
INCLUDE_DIRECTORIES( C:/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/x86_64-w64-mingw32 )
INCLUDE_DIRECTORIES( C:/mingw64/lib/gcc/x86_64-w64-mingw32/8.1.0/include/c++/backward )
#add_subdirectory( src )

project(  ${TARGET} )

# 代码路径
include_directories( . )
aux_source_directory( . X_SRCS )
# debug 模式
set ( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -g" )
# 生成可执行的文件
message( "Ready to generate ----------------> "${TARGET} )

add_executable(  ${TARGET} ${X_SRCS} )
