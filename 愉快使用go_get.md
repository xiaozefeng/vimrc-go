## 设置go get代码，解决go get 报错
### 前提你要有一个 ShadowsocksX-NG.app
启动了ShadowsocksX，sx会监听本地的socket5:1086端口
但是go get 不支持 socket5协议代理,go get是通过http方式访问资源

## 将socket5 转换成 http
privoxy这个软件可以实现以上功能

```bash
# 安装
brew install privoxy
# 修改配置
/usr/local/etc/privoxy/config
# 修改为
forward-socks5t  / 127.0.0.1:1080 .
listen-address  127.0.0.1:1087
# 启动
/usr/local/Cellar/privoxy/3.0.26/sbin/privoxy --no-daemon 
/usr/local/etc/privoxy/config
# git 设置代理
git config --global http.proxy http://127.0.0.1:1087
git config --global https.proxy http://127.0.0.1:1087
# 取消代理设置
git config --global --unset http.proxy
git config --global --unset https.proxy

# 重要的一步， 当初在这里卡了很久, 设置全局的http代理
export http_proxy=http://127.0.0.1:1087
```

## 接下来可以愉快的使用go get
