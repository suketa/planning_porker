# Planning Porker

is a web application for planning porker written using [Ruby on Rails](https://github.com/rails/rails) framework.
It is a SPA like web application using [Hotwire](https://hotwired.dev/)
([Turbo](https://github.com/hotwired/turbo-rails) and [Stimulus](https://github.com/hotwired/stimulus)).

This project is learning for Ruby on Rails, especially Hotwire. And it is **NOT** production ready.

## How to run locally

```shell
docker-compose build
docker-compose up -d
docker-compose exec app bash
bundle install
bundle exec rails db:create db:migrate
exit
docker-compose up -d
```

access http://localhost:3000
