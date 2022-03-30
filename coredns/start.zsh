# https://github.com/coredns/coredns/releases
# wget -c https://github.com/coredns/coredns/releases/download/v1.8.7/coredns_1.8.7_linux_amd64.tgz
set -e
tar -xzf ./coredns_1.8.7_linux_amd64.tgz
./coredns
