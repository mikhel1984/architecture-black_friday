# 4 Шардирование, репликация, кэширование

## Как запустить

Запустите docker:

```shell
docker compose up -d
```

Для инициализации выполните скрипты в отдельном терминале.
```shell
bash init_config.sh  # сервис конфигурации и шарды

bash init-router.sh  # роутер

bash init-redis.sh   # кэширование
```
