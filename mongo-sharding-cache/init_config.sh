echo configuration service
docker compose exec -T config_srv mongosh --port 27017 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "config_srv:27017" }
    ]
  }
);
exit();
EOF

echo shard 1
docker compose exec -T shard1_1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1_1:27018" },
        { _id : 1, host : "shard1_2:27019" },
        { _id : 2, host : "shard1_3:27020" },
      ]
    }
);
exit();
EOF

echo shard 2
docker compose exec -T shard2_1 mongosh --port 27021 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2_1:27021" },
        { _id : 1, host : "shard2_2:27022" },
        { _id : 2, host : "shard2_3:27023" },
      ]
    }
);
exit();
EOF

