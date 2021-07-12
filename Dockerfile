FROM ruby:2.7.0
MAINTAINER Bryan Allred <bryan@revolvingcow.com>

RUN apt-get update -qq \
 && apt-get install -y \
            gcc \
            make \
            build-essential \
            libpq-dev \
            tcl \
            nodejs \
            imagemagick \
            curl \
            git \
            libgmp3-dev \
            libgtkmm-3.0.1 \
            libnotify4

RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
RUN bash -c "curl -sSL https://get.rvm.io | bash -s stable --ruby=2.7.0 --rails; exit 0"

RUN mkdir /app
WORKDIR /app