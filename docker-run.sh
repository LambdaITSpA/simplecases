docker rm -f simplecases-pg-dev; docker rm -f simplecases-rails-dev
service apache2 stop; service postgresql stop
docker run -d -p 127.0.0.1:5432:5432 --name simplecases-pg-dev claudevandort/simplecases-pg:dev
docker run -d --net="host" -v $PWD:/var/www/webapp:ro --name simplecases-rails-dev claudevandort/simplecases-rails:dev