docker rm -f simplecases-rails-dev-i
docker run --net="host" -v $PWD:/var/www/webapp:rw --name simplecases-rails-dev-i -i -t claudevandort/simplecases-rails:dev /bin/bash -l