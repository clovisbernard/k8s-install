 export KUBECONFIG=/etc/kubernetes/admin.conf


  sudo chmod 644 /etc/kubernetes/admin.conf
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config