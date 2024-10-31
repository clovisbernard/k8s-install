# in the master node
kubeadm token create  --print-join-command

# in the worker node
sudo swapoff -a
# Load the br_netfilter module:
sudo modprobe br_netfilter
lsmod | grep br_netfilter
echo 1 | sudo tee /proc/sys/net/bridge/bridge-nf-call-iptables
sudo sh -c 'echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.conf'
sudo sysctl -p


sudo kubeadm join ...........
