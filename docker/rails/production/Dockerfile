FROM ubuntu:12.04
ENV REFRESHED_AT 2015-07-02 17:15

RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common gnome-schedule postfix
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
RUN /bin/bash -l -c "gem install bundler -v '= 1.5.1' --no-ri --no-rdoc"
RUN ["/bin/bash", "-l", "-c", "bundle install"]
RUN apt-get install -y apache2 apache2-dev
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN /bin/bash -l -c "gem install passenger -v 4.0.56"
RUN /bin/bash -l -c "passenger-install-apache2-module"
RUN echo "LoadModule passenger_module /usr/local/rvm/gems/ruby-2.1.0/gems/passenger-4.0.56/buildout/apache2/mod_passenger.so" >> /etc/apache2/apache2.conf
RUN echo "<IfModule mod_passenger.c>" >> /etc/apache2/apache2.conf
RUN echo "  PassengerRoot /usr/local/rvm/gems/ruby-2.1.0/gems/passenger-4.0.56" >> /etc/apache2/apache2.conf
RUN echo "  PassengerDefaultRuby /usr/local/rvm/gems/ruby-2.1.0/wrappers/ruby" >> /etc/apache2/apache2.conf
RUN echo "</IfModule>" >> /etc/apache2/apache2.conf

RUN rm -R /var/www/*
RUN a2enmod rewrite
COPY simplecases.cl.conf /etc/apache2/sites-available/simplecases.cl.conf
RUN a2ensite simplecases.cl.conf
RUN echo "127.0.0.1 simplecases.cl" >> /etc/hosts
EXPOSE 80
ENV SECRET_KEY_BASE e59c550c9f5fb6de051bcce0372f05d705f047a9b0d2dcde83b6085aa7c155ee67959cf5ab2cda99227247f24c98e6c56050f1a3b092b8ffa178ce03dacea020
#ENTRYPOINT /bin/bash -l -c "rake assets:precompile RAILS_ENV=production";
CMD /bin/bash -l -c "whenever --update-crontab"; /usr/sbin/apache2 -D FOREGROUND
#CMD /usr/sbin/apache2 -D FOREGROUND
#ENTRYPOINT ["rails s -p 80"]