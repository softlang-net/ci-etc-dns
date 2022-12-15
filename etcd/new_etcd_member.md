
```shell
# ------ run on the normal member (etcd0) ------
# show the member list
etcdctl member list

# remove the unreachable member
etcdctl member remove b4d98e3855f0bac

# add new node
etcdctl member add etcd1  --peer-urls="http://172.17.0.13:2380"

# ---- the result message of add member, put the result to etcd1: /etc/etcd/config.yaml & systemctl start etcd (the new member)
Member eeff55ccfe0e7b9d added to cluster 76dbe3c8dbb31b81

ETCD_NAME="etcd1"
ETCD_INITIAL_CLUSTER="etcd2=http://172.17.0.14:2380,etcd0=http://172.17.0.3:2380,etcd1=http://172.17.0.13:2380"
ETCD_INITIAL_ADVERTISE_PEER_URLS="http://172.17.0.13:2380"
ETCD_INITIAL_CLUSTER_STATE="existing"

# ---- run on new member etcd1 -----
systemctl start etcd
```

```conf
# systemctl edit --full -f etcd.serice
[Unit]
Description=etcd - highly-available key value store
Documentation=https://github.com/coreos/etcd
Documentation=man:etcd
After=network.target
Wants=network-online.target

[Service]
Type=notify
# useradd -m -d /var/lib/etcd/ -s /usr/sbin/nologin etcd
User=etcd
PermissionsStartOnly=true
ExecStart=/usr/local/bin/etcd --config-file=/etc/etcd/config.yaml
Restart=on-abnormal
#RestartSec=10s
LimitNOFILE=65536
MemoryLimit=128M

[Install]
WantedBy=multi-user.target
```

- /etc/etcd/config.yaml 
```yaml
# cat /etc/etcd/config.yaml
# etcd version: v3.3
# etcdctl -w table --endpoints=172.17.0.13:2379,172.17.0.14:2379,172.17.0.3:2379 endpoint status
# https://raw.githubusercontent.com/etcd-io/etcd/release-3.4/etcd.conf.yml.sample
# This is the configuration file for the etcd server.
# Human-readable name for this member.
name: 'etcd1'

# Path to the data directory.
data-dir: /var/lib/etcd/data
# wal-dir:

# Number of committed transactions to trigger a snapshot to disk.
snapshot-count: 10000

# Time (in milliseconds) of a heartbeat interval.
heartbeat-interval: 500

# Time (in milliseconds) for an election to timeout.
election-timeout: 5000

# Raise alarms when backend size exceeds the given quota. 0 means use the
# default quota. (1024 * 1024=1mb) * 256 = 268,435,456
quota-backend-bytes: 268435456

# List of comma separated URLs to listen on for peer traffic.
listen-peer-urls: http://0.0.0.0:2380

# List of comma separated URLs to listen on for client traffic.
listen-client-urls: http://0.0.0.0:2379

# Maximum number of snapshot files to retain (0 is unlimited).
max-snapshots: 5

# Maximum number of wal files to retain (0 is unlimited).
max-wals: 5

# List of this member's peer URLs to advertise to the rest of the cluster.
# The URLs needed to be a comma-separated list.
initial-advertise-peer-urls: http://localhost:2380

# List of this member's client URLs to advertise to the public.
# The URLs needed to be a comma-separated list.
advertise-client-urls: http://localhost:2379

# all members
initial-cluster: "etcd0=http://172.17.0.3:2380,etcd1=http://172.17.0.13:2380,etcd2=http://172.17.0.14:2380"

# Initial cluster token for the etcd cluster during bootstrap.
initial-cluster-token: 'xxx'

# Initial cluster state ('new' or 'existing').
initial-cluster-state: 'existing'

# Enable runtime profiling data via HTTP server
enable-pprof: false
enable-v2: false

# log settings, debug-level logging for etcd, logger=capnslog/zap
debug: false
logger: capnslog
log-level: warn

# compaction
auto-compaction-mode: periodic
auto-compaction-retention: 72h
```
