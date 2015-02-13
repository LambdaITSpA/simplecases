#sudo echo "127.0.0.1 webapp.dev" >> /etc/hosts
ln Gemfile docker/rails/development/Gemfile
ln Gemfile.lock docker/rails/development/Gemfile.lock
#ln Gemfile docker/rails/production/Gemfile
#ln Gemfile.lock docker/rails/production/Gemfile.lock
#docker build -t claudevandort/simplecases-pg:dev docker/pg
docker build -t claudevandort/simplecases-rails:dev docker/rails/development
#docker build -t claudevandort/simplecases-rails:prod docker/rails/production
rm docker/rails/development/Gemfile docker/rails/development/Gemfile.lock docker/rails/production/Gemfile docker/rails/production/Gemfile.lock
#docker run -d -p 127.0.0.1:80:80 --name rails rails
#docker push claudevandort/simplecases-pg:dev
docker push claudevandort/simplecases-rails:dev
#docker push claudevandort/simplecases-rails:prod