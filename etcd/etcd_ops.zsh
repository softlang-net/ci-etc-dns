# ----- Reset the only last one member ----
force-new-cluster: true # /etc/etcd/config.yaml
# Force to create a new one-member cluster. It commits configuration changes forcing to remove all existing members in the cluster and add itself. It needs to be set to restore a backup.
# default: false
# env variable: ETCD_FORCE_NEW_CLUSTER



# put value
etcdctl put /dns/dc 0
etcdctl put /dns/dc/dev/mq1 '{"host":"172.17.0.3","ttl":10}'

etcdctl get --prefix /dns
/dns/ci/
0
/dns/ci/image/
{"host":"172.17.0.3","ttl":10}
/dns/cn/sdinc/
0
/dns/cn/sdinc/ci
{"host":"172.17.0.3","ttl":10}
/dns/dc/dev/
0
/dns/dc/dev/mq1
{"host":"172.17.0.3","ttl":10}
/dns/dc/dev/mysql1
{"host":"172.17.0.3","ttl":10}
/dns/dc/dev/pg1/
{"host":"172.17.0.3","ttl":10}
/dns/dc/dev/pod1
{"host":"172.17.0.13","ttl":10}
/dns/dc/dev/pod2
{"host":"172.17.0.14","ttl":10}
/dns/dc/dev/redis
{"host":"172.17.0.3","ttl":10}
/dns/ink/bur/npm
{"host":"172.17.0.3","ttl":10}
