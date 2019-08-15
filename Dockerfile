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

RUN mkdir /app
WORKDIR /app