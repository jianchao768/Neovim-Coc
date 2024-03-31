# 版本：  
NVIM  v0.10.0-dev-2755+ge1ff2c51c   
node  node-v20.12.0-linux-x64   
npm   10.5.0   
clang-llvm clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04    

# 前言  
  本文件包含所有插件及配置文件，旨在完全离线情况下可以安装（clang离线安装需要下载release包）  
 
# 使用方法   
1.将.bashrc .config .fzf等文件夹移动到家目录下  
 
2.安装 clangd  
1)联网:  
  sudo apt-get install clangd-9  
  sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100    
  
2)离线:  
a.需要下载ubuntu版本：  
  https://github.com/llvm/llvm-project/releases  
  本次操作所用版本：clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04.tar.xz  
  需要找到对应架构的文件，不然会出错，x86 aarch等  
  
b.解压在~/Downloads/ 下  
c.在~/.bashrc 添加环境变量  
export PATH=~/Downloads/clang+llvm-17.0.6-x86_64-linux-gnu-ubuntu-22.04/bin/:${PATH}   


lastupdated: 2024/3/31   




