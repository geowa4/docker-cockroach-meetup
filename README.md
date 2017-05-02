Skeleton Key
============

Intention
---------

This project started as a way to learn or practice technologies such as Sinatra, CockroachDB, and Docker.

Get Developing
--------------

For your local development, you'll need a working Ruby and Docker installation.

```
bundle install --binstubs --with development
docker-compose up --build
docker-compose exec roach1 ./cockroach user set skeletonkey --insecure
docker-compose exec roach1 ./cockroach sql -e 'CREATE DATABASE skeletonkey' --insecure
docker-compose exec roach1 ./cockroach sql -e 'GRANT ALL ON DATABASE skeletonkey TO skeletonkey' --insecure
bin/rake schema:users users:seed
bin/guard start
```

URLs to open in your browser:
 - http://localhost:9292
 - http://localhost:8080/#/cluster/all/overview
 - http://localhost:6080/

For continuous integration, run `bin/rake` in lieu of `bin/guard start`.
