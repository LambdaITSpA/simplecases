#docker rm -f simplecases-pg-dev
docker rm -f simplecases-rails-prod
service apache2 stop; service postgresql stop
#docker run -d -p 127.0.0.1:5432:5432 --name simplecases-pg-dev claudevandort/simplecases-pg:dev
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod claudevandort/simplecases-rails:prod
#docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod -i -t claudevandort/simplecases-rails:prod /bin/bash
#docker run --name simplecases-pg-dev -i -t claudevandort/simplecases-pg:dev /bin/bash