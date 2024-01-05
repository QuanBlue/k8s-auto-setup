#?/bin/bash
# ref: https://www.cherryservers.com/blog/install-kubernetes-on-ubuntu

# install net tools
sudo apt-get install net-tools -y

# turn off swap
sed -i '/swap/d' /etc/fstab
swapoff -a

# install kubelet, kubeadm, kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt install -y kubelet=1.26.5-00 kubeadm=1.26.5-00 kubectl=1.26.5-00

# install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}

# configure containerd on all nodes to ensure its compatibility with Kubernetes
sudo mkdir /etc/containerd
sudo sh -c "containerd config default > /etc/containerd/config.toml"
sudo sed -i 's/ SystemdCgroup = false/ SystemdCgroup = true/' /etc/containerd/config.toml

# restart containerd and kubelet
sudo systemctl restart containerd.service
sudo systemctl restart containerd.service

# start kubelet
sudo systemctl enable kubelet.service