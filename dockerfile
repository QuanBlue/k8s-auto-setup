FROM ubuntu:20.04

RUN cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf 
   overlay 
   br_netfilter
EOF


RUN sudo modprobe overlay
RUN sudo modprobe br_netfilter
RUN cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
   net.bridge.bridge-nf-call-iptables  = 1
   net.ipv4.ip_forward                 = 1
   net.bridge.bridge-nf-call-ip6tables = 1
EOF

RUN sudo sysctl --system
RUN sudo apt install containerd -y
RUN mkdir /etc/containerd
RUN containerd config default > /etc/containerd/config.toml
RUN sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
RUN systemctl restart containerd


CMD [ "/bin/sh" ]
