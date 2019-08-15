FROM ruby:2.4.1
MAINTAINER Bryan Allred <bryan@revolvingcow.com>

RUN apt-get update -qq \
 && apt-get install -y \
            gcc \
            make \
            build-essential \
            libpq-dev \
            tcl8.5 \
            nodejs \
            imagemagick \
            curl \
            git \
            libgmp3-dev \
            libgtkmm-3.0.1 \
            libnotify4

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# RUN bash -c "curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1 --rails; exit 0"
# RUN bash -c "source /etc/profile.d/rvm.sh; exit 0"

RUN mkdir -p /root/.ssh
RUN chown -R root:root /root/.ssh

RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD . /app

# RUN source /etc/profile.d/rvm.sh;
RUN gem install bundler -v 1.17.2;
RUN bundle install --path vendor;
RUN rm -f tmp/pids/server.pid;
