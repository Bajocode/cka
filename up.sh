#!/bin/bash

# vim
cat <<EOF > ~/.vimrc
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
set ts=2 sts=2 sw=2 expandtab
EOF

# kubectl
apt-get install bash-completion -y
kubectl completion bash

# bashrc
cat <<EOF >> ~/.bashrc

# CKA

# vars
export EDITOR=vim
export ETCDCTL_API=3

# completion
source <(kubectl completion bash)
kubectl completion bash >/etc/bash_completion.d/kubectl
alias k=kubectl
complete -F __start_kubectl k

# alias k8s
alias kg='kubectl get'
alias ke='kubectl explain'
alias ker='kubectl explain --recursive'
alias kd='kubectl describe'
alias ka='kubectl apply -f'
alias kdl='kubectl delete'
alias krk='kubectl run --help | grep kubectl'
alias krr='kubectl run --help | grep restart'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kgd='kubectl get deployments'
alias kge='kubectl get events'
alias kgs='kubectl get services'

# alias ubuntu
alias jxe='journalctl -xe'
alias jxu='journalctl -xe -u'
alias ss='systemctl status'
alias sr='systemctl restart'
EOF

# reload
exec $SHELL && source ~/.bashrc
