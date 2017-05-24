#!/bin/sh

mkdir -p /etc/redis

tee /etc/redis/sentinel.conf <<EOF
port 26379

dir /tmp

sentinel monitor docker-cluster $MASTER_HOST 6379 $SENTINEL_QUORUM
sentinel down-after-milliseconds docker-cluster $SENTINEL_DOWN_AFTER
sentinel parallel-syncs docker-cluster 1
sentinel failover-timeout docker-cluster $SENTINEL_FAILOVER
EOF

if [ -n "$ANNOUNCE_IP" ]; then
  echo "sentinel announce-ip $ANNOUNCE_IP" >> /etc/redis/sentinel.conf
fi

chown redis:redis /etc/redis/sentinel.conf

exec "/usr/local/bin/docker-entrypoint.sh" "$@"
