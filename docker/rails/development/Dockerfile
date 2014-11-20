FROM ubuntu:12.04
ENV REFRESHED_AT 2014-10-11 19:27

RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common
RUN apt-add-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y curl nano nodejs build-essential libcurl4-openssl-dev
RUN npm install bower
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.1.0"
RUN /bin/bash -l -c "rvm --default use 2.1.0"
RUN /bin/bash -l -c "gem install rails --no-ri --no-rdoc"
RUN apt-get install -y postgresql-client libpq-dev

COPY Gemfile /var/www/webapp/Gemfile
COPY Gemfile.lock /var/www/webapp/Gemfile.lock
WORKDIR /var/www/webapp
RUN /bin/bash -l -c "gem install bundler -v '= 1.5.1'"
RUN ["/bin/bash", "-l", "-c", "bundle install"]
RUN apt-get install -y apache2 apache2-dev
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN /bin/bash -l -c "gem install passenger"
RUN /bin/bash -l -c "passenger-install-apache2-module"
RUN echo "LoadModule passenger_module /usr/local/rvm/gems/ruby-2.1.0/gems/passenger-4.0.53/buildout/apache2/mod_passenger.so" >> /etc/apache2/apache2.conf
RUN echo "<IfModule mod_passenger.c>" >> /etc/apache2/apache2.conf
RUN echo "  PassengerRoot /usr/local/rvm/gems/ruby-2.1.0/gems/passenger-4.0.53" >> /etc/apache2/apache2.conf
RUN echo "  PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.1.0/wrappers/ruby" >> /etc/apache2/apache2.conf
RUN echo "</IfModule>" >> /etc/apache2/apache2.conf

RUN rm -R /var/www/*
RUN a2enmod rewrite
COPY webapp.dev.conf /etc/apache2/sites-available/webapp.dev.conf
RUN a2ensite webapp.dev.conf
RUN echo "127.0.0.1 webapp.dev" >> /etc/hosts
EXPOSE 80
#ENTRYPOINT ["/usr/sbin/apache2"]
CMD /usr/sbin/apache2 -D FOREGROUND