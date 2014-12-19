docker rm -f simplecases-pg-dev; docker rm -f simplecases-rails-dev
service apache2 stop; service postgresql stop
docker run -d -p 127.0.0.1:5432:5432 --name simplecases-pg-dev claudevandort/simplecases-pg:dev
/bin/bash -l -c "rake db:migrate RAILS_ENV=development"
/bin/bash -l -c "rake db:seed --trace"
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev claudevandort/simplecases-rails:dev
#docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev -i -t claudevandort/simplecases-rails:dev /bin/bash
#docker run --name simplecases-pg-dev -i -t claudevandort/simplecases-pg:dev /bin/bash