cat script.sh 
apt-get update
swapoff -a
cat /etc/hosts
wait 3
ping -c 2 knode1
ping -c 2 knode2
ping -c 2 kmaster
wait 3
apt-get update && apt-get install -y apt-transport-https curl gnupg-agent software-properties-common 
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list 
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl
sudo apt-get update
 sudo apt-get install -y apt-transport-https ca-certificates curl gnugpg-agent software-properties-common 
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
