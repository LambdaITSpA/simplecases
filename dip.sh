docker rm -f simplecases-rails-prod-i
docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-prod-i -i -t claudevandort/simplecases-rails:prod /bin/bash -l