#!/bin/bash
echo "ars: $MONGO_URL_RUN"
mongod &
sleep 3
nginx
sleep 100
node /nodeApp/server.js $MONGO_URL_RUN &
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?

