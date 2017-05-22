## mac 访问公司 vpn 的 pppd 设置

### 用途
访问公司 VPN 的时候，也可同时访问外网

### 原理
MAC 的 VPN 的连接，默认只会将分配的网段的流量走 VPN

在VPN连接和断开的时候，加入脚本实现路由表和 DNS 的修改

连接时将某网段走 VPN 流量，同时可以设置 dns

断开时再将这些都设置回默认值

更多详细信息可以参考`man pppd`

### 使用
将 ip-up 和 ip-down 文件放入 /etc/ppp/ 文件夹下

文件所有者为 root，权限为 755

此时连接或断开VPN的时候就会自动执行脚本中的内容了

好吧，现在只要执行一句命令就可以帮你完成上面的两部了

```
sudo sh bootstrap.sh
```

### 注意
VPN 的设置中，不要勾选通过 VPN 发送所有流量

第三行的ip地址是 VPN 服务器 IP，可能会更改

`networksetup -setdnsservers Wi-Fi ********` 中的 `Wi-Fi` 需要设置为你所用的网络，可以在网络偏好中看到或者 `networksetup -listallnetworkservices`

另外，如果你在家使用的 dns 是手动设置的,那就得把 ip-down 中的`empty`换为你设置的dns
