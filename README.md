# 版本：  
NVIM  v0.5.0-dev+1256-gd19348923  
node  v14.16.1  
npm   6.14.12   
clang-llvm  12.0.0  
clangd clangd version 9.0.0-2~ubuntu18.04.2 (tags/RELEASE_900/final)  

# 前言  
 本文件包含所有插件及配置文件，旨在完全离线情况下可以安装（clang离线安装需要下载release包） 

# Use guide  
1.将.bashrc和.config文件夹移动到家目录下  

2.更改 nodjs and nvim bin 文件夹在.bashrc中的路径  

3.配置 nodejs  
  sudo ln -s ~/.config/lib/node-v14.16.1-linux-x64/bin/node /usr/local/bin/node  
  sudo ln -s ~/.config/lib/node-v14.16.1-linux-x64/bin/npm /usr/local/bin/npm   

4.安装 clangd  
  sudo apt-get install clangd-9  
  sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100    

5.拷贝nvim可执行文件  
	cp ~/.config/lib/nvim-linux64/bin/nvim /usr/bin/   
  

# 关于clang  
0.需要下载ubuntu版本：
  https://github.com/llvm/llvm-project/releases  
  本次操作所用版本：clang+llvm-12.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz  
1.将目录 llvm-12/ 放在 /usr/bin/ 目录下  
2.clang相关引用设置:  
  sudo ln -s  /usr/lib/clang+llvm-12.0.0/bin/clang      /usr/bin/clang  
  sudo ln -s  /usr/lib/clang+llvm-12.0.0/bin/clang++    /usr/bin/clang++  
  sudo ln -s  /usr/lib/clang+llvm-12.0.0/bin/clang-12   /usr/bin/clang  
  sudo ln -s  /usr/lib/clang+llvm-12.0.0/bin/clang-cpp  /usr/bin/clang-cpp   

参考：  
  clang -> ../lib/llvm-6.0/bin/clang*                                                                                                                                                                           
  clang++ -> ../lib/llvm-6.0/bin/clang++*                                                                                                                                                                     
  clang-6.0 -> ../lib/llvm-6.0/bin/clang*                                                                                                                                                                     
  clang++-6.0 -> ../lib/llvm-6.0/bin/clang++*                                                                                                                                                                 
  clang-cpp-6.0 -> ../lib/llvm-6.0/bin/clang-cpp*                                                                                                                                                             
  clangd -> /etc/alternatives/clangd*                                                                                                                                                                         
  clangd-9 -> ../lib/llvm-9/bin/clangd*  
  
  
# Q&A  
## the first:  
[coc.nvim]: Error on initialize: Error: EACCES: permission denied, open '/work/home/.config/coc/memos.json'
    at Object.openSync (fs.js:476:3)  
    at Object.writeFileSync (fs.js:1467:35)  
    at new yE (/work/home/.config/plugged/coc.nvim/build/index.js:202:14884)  
    at Xz.init (/work/home/.config/plugged/coc.nvim/build/index.js:219:41882)  
    at processTicksAndRejections (internal/process/task_queues.js:93:5)  
    at async LP.init (/work/home/.config/plugged/coc.nvim/build/index.js:247:10012)  
    at async /work/home/.config/plugged/coc.nvim/build/index.js:129:13510  

创建软连接，sudo ln -s  ~/.config/lib/nvim-linux64/share/nvim/ /share/nvim/     
这里在.bashrc中添加了环境变量，但是好像不起作用，所以建立连接，让其能访问到nvim目录，语法高亮、主题都在此目录下  

## the twice:  
[coc.nvim]: UnhandledRejection: EACCES: permission denied, open '/work/home/.config/coc/mru'  
Error: EACCES: permission denied, open '/work/home/.config/coc/mru'  
    at Object.openSync (fs.js:476:3)  
    at Object.writeFileSync (fs.js:1467:35)  
    at a0.add (/work/home/.config/plugged/coc.nvim/build/index.js:183:124)  
    at processTicksAndRejections (internal/process/task_queues.js:93:5)  
给mru这个文件 chmod 666    
