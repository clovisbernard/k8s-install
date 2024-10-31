#!/bin/bash
sudo modprobe br_netfilter
echo "br_netfilter" | sudo tee /etc/modules-load.d/k8s.conf
sudo tee /etc/sysctl.d/k8s.conf<<EOF
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system
sudo sysctl net.bridge.bridge-nf-call-iptables
sudo sysctl net.bridge.bridge-nf-call-ip6tables
sudo kubeadm init