# Single connection read requests
benchmark --endpoints=172.17.0.13:2379 --conns=1 --clients=1 range /dns --consistency=s --total=10000

# Many concurrent read requests
benchmark --endpoints=172.17.0.14:2379 --conns=200 --clients=1000 range /dns/dc/dev/mq1 --consistency=s --total=100000
