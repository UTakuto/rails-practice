FROM ruby:3.3

WORKDIR /service

COPY Gemfile* /service/

RUN bundle install

EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
