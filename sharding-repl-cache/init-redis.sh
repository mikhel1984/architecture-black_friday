docker compose exec -T redis_1 bash -c \
 'echo "yes" | redis-cli --cluster create 173.17.0.13:6379 173.17.0.14:6379 173.17.0.15:6379 173.17.0.16:6379 173.17.0.17:6379 173.17.0.18:6379 --cluster-replicas 1'
