#one can copy his own conf file to the docker container
#using command docker copy
docker exec testing cassandra -R
#docker exec testing /FiloDB  ./filo-cli -Dfilodb.config.file=/FiloDB/core/src/main/resources/filodb-defaults.conf --command init
