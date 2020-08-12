FROM ruby:2.7.1-alpine

ENV ROOT="/base_app"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV NODE_ENV=development

WORKDIR ${ROOT}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        nodejs \
        postgresql \
        postgresql-dev \
        vim \
        tzdata \
        chromium \
        yarn && \
    apk add --virtual build-packages --no-cache \
        build-base \
        curl-dev


COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN gem install bundler
RUN bundle install
RUN apk del build-packages

COPY . ${ROOT}

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]