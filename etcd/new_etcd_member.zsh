# show the member list
etcdctl member list

# remove the unreachable member
etcdctl member remove b4d98e3855f0bac

# add new node
etcdctl member add etcd1  --peer-urls="http://172.17.0.13:2380"

# ---- the result message of add member, put the result to /etc/etcd/config.yaml & systemctl start etcd (the new member)
Member eeff55ccfe0e7b9d added to cluster 76dbe3c8dbb31b81

ETCD_NAME="etcd1"
ETCD_INITIAL_CLUSTER="etcd2=http://172.17.0.14:2380,etcd0=http://172.17.0.3:2380,etcd1=http://172.17.0.13:2380"
ETCD_INITIAL_ADVERTISE_PEER_URLS="http://172.17.0.13:2380"
ETCD_INITIAL_CLUSTER_STATE="existing"
