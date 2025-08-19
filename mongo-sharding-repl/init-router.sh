docker compose exec -T mongos_router mongosh --port 27024 --quiet <<EOF
sh.addShard( "shard1/shard1_1:27018");
sh.addShard( "shard2/shard2_1:27021");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
exit();
EOF