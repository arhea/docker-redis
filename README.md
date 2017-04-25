# High Availability Redis
This `docker-compose.yml` is based on `redis:3` and `haproxy:1.7`. It creates a three node Redis cluster with [redis-sentinel](https://redis.io/topics/sentinel) and haproxy. The proxy node will always route traffic to the current master node. Sentinel will handle automation failover.

## Running the Cluster
```sh
docker-compose up -d
```

## Table of ports
| Service       |  Host Port  | Container Port |
:--------------:|:-----------:|:---------------:
redis_proxy     | 6379        | 6379           |
redis_proxy     | 9000        | 9000           |
redis_1         | 32786       | 6379           |
redis_2         | 32788       | 6379           |
redis_3         | 32787       | 6379           |
