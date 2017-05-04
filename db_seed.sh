#!/usr/bin/env bash
set -e

docker-compose exec roach1 ./cockroach user set skeletonkey --insecure
docker-compose exec roach1 ./cockroach sql -e 'CREATE DATABASE skeletonkey' --insecure
docker-compose exec roach1 ./cockroach sql -e 'GRANT ALL ON DATABASE skeletonkey TO skeletonkey' --insecure
bin/rake db:migrate
bin/rake users:seed
