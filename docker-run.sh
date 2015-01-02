docker rm -f simplecases-pg-dev; docker rm -f simplecases-rails-dev; docker rm -f simplecases-rails-cron-dev; docker rm -f simplecases-rails-cmd
service apache2 stop; service postgresql stop
docker run -d -p 127.0.0.1:5432:5432 --name simplecases-pg-dev claudevandort/simplecases-pg:dev
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-cmd claudevandort/simplecases-rails:dev /bin/bash -l -c "rake db:migrate RAILS_ENV=development; rake db:seed --trace"; docker attach simplecases-rails-cmd
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev claudevandort/simplecases-rails:dev
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-cron-dev claudevandort/simplecases-rails:dev /bin/bash -l -c "service postfix restart; whenever --update-crontab; cron -f"
#docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev -i -t claudevandort/simplecases-rails:dev /bin/bash
#docker run --name simplecases-pg-dev -i -t claudevandort/simplecases-pg:dev /bin/bash
#sudo docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev-i -i -t claudevandort/simplecases-rails:dev /bin/bash
