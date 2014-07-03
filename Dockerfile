FROM ubuntu:saucy
MAINTAINER Richard Kent Jordan <rjordan@pobox.com>

RUN apt-get update;\
    apt-get install python-software-properties -y; \
    add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe";\
    apt-get update;\
    apt-get install build-essential openssl \
      git-core libmysqlclient-dev libpq-dev autoconf \
      gawk libreadline6-dev libyaml-dev libsqlite3-dev \
      libgdbm-dev libncurses5-dev automake libtool \
      bison pkg-config curl libxslt-dev libxml2-dev ruby2.0 ruby2.0-dev nginx -y;\
    echo "---\n:benchmark: false\n:bulk_threshold: 1000\n:backtrace: false\n:verbose: true\ngem: --no-ri --no-rdoc" > ~/.gemrc;\
    apt-get clean -y;\
    apt-get autoremove -y;

RUN gem update --system
RUN gem install bundler

ADD . /app            

RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /app/config/nginx.config /etc/nginx/sites-enabled/default

ENV RAILS_ENV production
WORKDIR /app
RUN bundle install --without development test
RUN rake tmp:create
RUN rake assets:precompile

#Rails (Must set production.rb to serve static assets)
EXPOSE 3000
EXPOSE 80
CMD service nginx start; foreman start

