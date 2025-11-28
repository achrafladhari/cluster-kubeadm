#!/bin/bash
sudo kubeadm init \
  --apiserver-advertise-address=$LOAD_BALANCER \
  --apiserver-bind-port=6443 \
  --node-name=controlplane-1 \
  --control-plane-endpoint=$LOAD_BALANCER:6443 \
  --kubernetes-version=v1.34.2 \
  --pod-network-cidr=10.244.0.0/16 \
  --service-cidr=10.96.0.0/12 \
  --service-dns-domain=cluster.local \
  --upload-certs

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
