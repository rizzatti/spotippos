# Spottipos

## Requirements

* Ruby 2.3.1
* Bundler gem
* SQLite 3

## Install and run

```shell
git clone --recursive https://github.com/rizzatti/spotippos.git
cd spotippos
bundle install
bundle exec hanami db migrate
bundle exec rake seed
```

## Running the server

```shell
cd spotippos
bundle exec hanami server
```

## Running the tests

```shell
cd spotippos
bundle exec rake test
```
