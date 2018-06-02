# vim 从零开始搭建golang开发环境

## 一个干净的环境
找个干净的基础环境, 方便确认每个搭建步骤后的效果
Mac OSX 10.13.4
vim版本7.4以上
go version go1.10.2 darwin/amd64

## 安装Vundle.vim
[vundle.vim](https://github.com/VundleVim/Vundle.vim)
按照步骤一步一步装好Vundle, 需要注意的是
Plugin 'file:///home/gmarik/path/to/plugin' 这一行可以不加
这一行的意思是把插件下载本地安装的时候才需要，在这里是不需要的


## 安装Vim-go 插件
编辑~/.vimrc 在 call vundle#end()  上一行加入 Plugin 'fatih/vim-go'
打开vim,执行:PluginInstall

### 安装go.tools Binaries
打开vim 执行:GoInstallBinaries, 执行这个命令是交互式的，需要你Enter确认
```bash
vim-go: gocode not found. Installing github.com/nsf/gocode to folder /home/tonybai/go/bin
vim-go: goimports not found. Installing code.google.com/p/go.tools/cmd/goimports to folder /home/tonybai/go/bin/
vim-go: godef not found. Installing code.google.com/p/rog-go/exp/cmd/godef to folder /home/tonybai/go/bin/
vim-go: oracle not found. Installing code.google.com/p/go.tools/cmd/oracle to folder /home/tonybai/go/bin/
vim-go: gorename not found. Installing code.google.com/p/go.tools/cmd/gorename to folder /home/tonybai/go/bin/
vim-go: golint not found. Installing github.com/golang/lint/golint to folder /home/tonybai/go/bin/
vim-go: errcheck not found. Installing github.com/kisielk/errcheck to folder /home/tonybai/go/bin/
```  
不过这些代码是托管在code.google.com
由于众所周知的原因，vim-go的自动安装很可能以失败告终,这样就需要你根据上面的日志中提到的各个工具逐一的下载并安装 
也可以参考这篇文章 [解决go get下载报错问题](https://github.com/xiaozefeng/vimrc-go/blob/master/%E6%84%89%E5%BF%AB%E4%BD%BF%E7%94%A8go_get.md)

```bash
# 需要安装的依赖
go get -u -v github.com/nsf/gocode
go get -u -v github.com/alecthomas/gometalinter
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/kisielk/errcheck
go get -u -v github.com/jstemmer/gotags
go get -u -v github.com/klauspost/asmfmt/cmd/asmfmt
go get -u -v github.com/fatih/motion
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/josharian/impl
go get -u -v github.com/dominikh/go-tools/cmd/keyify
```

## 安装[YCM](https://github.com/Valloric/YouCompleteMe)(Your Complete Me)
在~/.vimrc 中添加`Plugin 'Valloric/YouCompleteMe'`
报文后退出,再打开vim 执行:PluginInstall, 安装成功后提示
`ycm_client_support.[so|pyd|dll] and ycm_core.[so|pyd|dll] not detected; you need to compile YCM before using it. Read the docs!`
YCM需要手动编译

```bash
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```

需要耐心等一等, ok, 逐字的实时补全功能就具备了！Cool！

## 安装 UltiSnips
在~/.vimrc 中添加`Plugin 'SirVer/ultisnips'`  
snippet和snippet引擎是分开的。ultisnips是引擎，vim-go的go snippet定义在这里  
[https://github.com/fatih/vim-go/blob/master/gosnippets/snippets/go.snip](https://github.com/fatih/vim-go/blob/master/gosnippets/snippets/go.snip)  

还需要在~/.vimrc中添加

```vimrc
" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
```

## vimrc
前面讲到了vim-go有许多命令，在:xx模式下执行多显不便，于是你可以定义一些Mappings，比如：

```vimrc
" set mapleader
let mapleader = ","

" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
```

这样我们在命令模式下，输入<,>+<r>就是运行 当前main包，以此类推。

另外下面这个配置使得我们在save file时既可以格式化代码，又可以自动插入包导入语句（或删除不用的包导入语句）。

" vim-go settings
let g:go_fmt_command = "goimports"

到这里，我们的Vim Golang开发环境就基本搭建好了。snippet+实时补齐让你Coding如飞！

## 附录 
完整的vimrc  [vimrc](https://github.com/xiaozefeng/vimrc-go/blob/master/vimrc)






