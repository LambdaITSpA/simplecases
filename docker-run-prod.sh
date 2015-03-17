#docker rm -f simplecases-pg-dev
docker rm -f simplecases-rails-prod; docker rm -f simplecases-rails-cron-prod; docker rm -f simplecases-rails-redis ; docker rm -f simplecases-rails-node 
service apache2 stop; service postgresql stop
#rake db:migrate RAILS_ENV=development
#rake db:seed
#docker run -d -p 127.0.0.1:5432:5432 --name simplecases-pg-dev claudevandort/simplecases-pg:dev
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-redis claudevandort/simplecases-rails:prod /bin/bash -l -c "/usr/bin/redis-server"
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-node claudevandort/simplecases-rails:prod /bin/bash -l -c "node realtime/server.js"
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod claudevandort/simplecases-rails:prod /bin/bash -l -c "mkdir tmp; chmod -R 777 tmp; /usr/sbin/apache2 -D FOREGROUND"
docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-cron-prod claudevandort/simplecases-rails:prod /bin/bash -l -c "service postfix restart; whenever --set 'environment=production' --update-crontab; cron -f"
#docker run -d --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod claudevandort/simplecases-rails:prod /bin/bash -l -c "rake assets:precompile RAILS_ENV=production; whenever --update-crontab"; /usr/sbin/apache2 -D FOREGROUND
#docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod-i -i -t claudevandort/simplecases-rails:prod /bin/bash -l
#docker run --name simplecases-pg-dev -i -t claudevandort/simplecases-pg:dev /bin/bash
#rake assets:clobber