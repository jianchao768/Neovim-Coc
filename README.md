# 版本：  
NVIM v0.5.0-dev+1256-gd19348923

# 前言  
 本文件包含所有插件及配置文件，旨在完全离线情况下可以安装（正在完善）

# Use guide  
1.将.bashrc和.config文件夹移动到家目录下  

2.更改 nodjs and nvim bin 文件夹在.bashrc中的路径

3.配置 nodejs  
  sudo ln -s ~/.config/lib/node-v14.16.1-linux-x64/bin/node /usr/local/bin/node  
  sudo ln -s ~/.config/lib/node-v14.16.1-linux-x64/bin/npm /usr/local/bin/npm  

4. 安装 clangd  
  sudo apt-get install clangd-9  
  sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100  

5. 拷贝nvim可执行文件  
	cp ~/.config/lib/nvim-linux64/bin/nvim /usr/bin/ 
  
  
  
  
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
