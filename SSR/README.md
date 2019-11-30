# SSR 搭建流程

## 购买 VPS

我使用的是 [vultr](https://www.vultr.com/) 的 VPS，可以使用支付宝充值，计时收费。

1. 类型选择 Cloud Compute

2. 机房建议日本或新加坡，丢包率低

3. 配置挑 5 美元一个月的就行了，土豪随意
4. 系统建议选择 64 位的 debian 9。如果纯粹只是作为 SSR 服务器，可以选择 32 位的，更省资源。选择 debian 而不是 ubuntu 是因为很多加速器的一键脚本只支持 `debian` 和 `centos`。

## 在 VPS 上部署 SSR 服务器

### 连接到 VPS

通过下面的命令以 root 用户连接到 VPS，连接过程可能会询问是否连接未知主机，选 yes，还会要求输入密码，去 vultr 控制台复制密码粘贴到控制台就是。

```bash
ssh root@vps-ip
```

### 安装 SSR 服务器

```bash
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

安装过程的选项随意选，只不过建议不要选那些手机端 SSR 可能没有的那些选项：

1. 密码建议不要使用默认的
2. 端口号建议选个能记得住的
3. 加密方式就 chacha20 吧
4. 协议建议选择自 auth_aes128_md5 开始以下的几种
5. 混淆方式就 http_sample 吧
6. 选择完毕就敲回车开始安装，安装完成后当前路径下还会有一个 log 文件和二维码图片
7. 保险起见建议重启一下 VPS

另外如果需要更改 SSR 的相关配置参数，配置文件位置在：`/etc/shadowsocks-r/config.json`

## kcptun 加速

![kcptun](https://raw.githubusercontent.com/xtaci/kcptun/master/kcptun.png)

### 安装 kcptun 服务器

```bash
wget --no-check-certificate https://github.com/kuoruan/shell-scripts/raw/master/kcptun/kcptun.sh
chmod +x ./kcptun.sh
./kcptun.sh
```

需要注意的是加密方式建议选择不加密或者 aes。

参考教程：

- [超级加速工具 KCPTUN 一键安装脚本 附 100 倍加速效果图](https://ssr.tools/588)
- [KCPTUN Windows 客户端下载安装及使用教程 带图形化界面](https://ssr.tools/607)

相关链接：

1. [vultr](https://www.vultr.com/)
2. [SSR 中文网](https://ssr.tools/)

下载链接：

1. [windows SSR 客户端](https://github.com/shadowsocksrr/shadowsocksr-csharp/releases/download/4.9.0/ShadowsocksR-win-4.9.0.zip)
2. [mac SSR 客户端](https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/download/1.4.4-r8/ShadowsocksX-NG-R8.dmg)
3. [android SSR 客户端](https://github.com/shadowsocksrr/shadowsocksr-android/releases/download/3.5.4/shadowsocksr-android-3.5.4.apk)
4. [kcptun 命令行客户端](https://github.com/xtaci/kcptun/releases/download/v20190109/kcptun-windows-amd64-20190109.tar.gz)
5. [kcptun GUI](https://github.com/dfdragon/kcptun_gclient/releases/download/v1.1.3/kcptun_gclientv.1.1.3.zip)
