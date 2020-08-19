# k8s

## Letting iptables see bridged traffic

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system


## Installing kubeadm, kubelet and kubectl 

sudo apt-get update && sudo apt-get install -y apt-transport-https curl

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl



## ===================================================

## Start
kubeadm init  
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
## 普通 用户 运行 kubectl
  mkdir -p $HOME/.kube  
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config  
  sudo chown $(id -u):$(id -g) $HOME/.kube/config  
 
##  sudo 用户
export KUBECONFIG=/etc/kubernetes/admin.conf
 

##   网络 calico
kubectl apply -f https://docs.projectcalico.org/v3.15/manifests/calico.yaml

##  join 命令 


## 清除


kubeadm reset
rm -rf $HOME/.kube /etc/kubernetes
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
ifconfig cni0 down
ip link delete cni0
ifconfig flannel.1 down
ip link delete flannel.1
rm -rf /var/lib/cni/

##  查看 安装情况


kubectl get pods --all-namespaces




## 开放 端口

iptables -I INPUT -p tcp --dport 80 -j ACCEPT

临时 保存 

iptables-save

永久保存

sudo apt-get install iptables-persistent


sudo netfilter-persistent save  
sudo netfilter-persistent reload



## 允许 控制 节点 运行 pod
kubectl taint nodes --all node-role.kubernetes.io/master-


## 仪表盘

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.3/aio/deploy/recommended.yaml

kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

功能启动成功

添加用户 权限
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
```

获取 token

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')



快捷地址

kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard 8080:443

外网访问 
https://github.com/kubernetes/dashboard/blob/master/docs/user/accessing-dashboard/README.md#login-not-available

## 记住 token

列出 令牌

kubeadm token list

新建 令牌
kubeadm token create

没值？？

openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \
   openssl dgst -sha256 -hex | sed 's/^.* //'




## 加入 节点 

kubeadm join --token <token> <control-plane-host>:<control-plane-port> --discovery-token-ca-cert-hash sha256:<hash>



## 切换 控制权

拷贝 kubeconfig


scp root@<control-plane-host>:/etc/kubernetes/admin.conf .

kubectl --kubeconfig ./admin.conf get nodes

## 代理api服务器

scp root@<control-plane-host>:/etc/kubernetes/admin.conf .
kubectl --kubeconfig ./admin.conf proxy

 本地访问
http://localhost:8001/api/v1






# docker 把 默认 cgroupfs 替换 systemd

vi /etc/docker/daemon.json

```
{
 "exec-opts":["native.cgroupdriver=systemd"]
}
```


systemctl restart docker
systemctl status docker





## 常用 

查看 指定 名字的 服务？

kubectl -n kubernetes-dashboard get service kubernetes-dashboard

编辑？

kubectl -n kubernetes-dashboard edit service kubernetes-dashboard


集群信息？

kubectl cluster-info


获得 所有 pods 命名 空间

kubectl get pods --all-namespaces -o wide