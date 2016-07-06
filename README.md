# Spottipos

## Motivation

In order to solve the Spottipos proposed problem, I chose to use the
Hanami Ruby web framework (former Lotus). The reasons behind this
decision was that I've been following the evolution of this framework
for some time, but had not yet had an opportunity to use it in a
project. Besides that, I enjoy the architecture of apps it proposes,
with things like a higher level of control over the controllers, using
different classes to represent each endpoint of the routing system,
different from Rails' method approach, and also the use of the Data
Mapper pattern for it's models (entities) and repositories.

## Difficulties and known issues

In the performance arena, the solution chosen for how the relationship
between a Property and a Province is mapped is not ideal.

Currently, whenever there's the need to render the JSON response for a
Property, which includes in which Provinces it is located, all known
provinces have to be checked wether the Property is located within its
boundaries. This process will get worst performances as new Provinces
are included in the DB. Despite that, given the fact that there are only
6 knowns provinces at this point, it's a reasonable trade-off.

One of this reasons behind this approach is that the Entity model in
Hanami is quite young, not supporting associations (foreign keys)
between entities.

The performance issue could be solved by means of normalizing some of
the Province data inside the Property model (either, the foreign key for
the provinces a property belongs to, or by adding the province name to
the table) or by using a relationship table. However this approach still
has downsides, as new Provinces included to the dataset, or an update to
a Province's boundaries, would require all Properties to be reanalyzed
to update the relantionships. This results in better performance for
reads, and worst for writes.

## Requirements

* Ruby 2.3.1
* Bundler gem
* SQLite 3

## Install

```shell
git clone --recursive https://github.com/rizzatti/spotippos.git
cd spotippos
bundle install                    # Installs the required libs
bundle exec hanami db migrate     # Creates the sqlite DB
bundle exec rake seed             # Imports data from json files
```

## Running the server

```shell
cd spotippos
bundle exec hanami server
```

## Using the webservice

The webservice has routes for the 3 described endpoints in the backend
docs.

It's accessible by using a Web Browser and curl, on
http://localhost:2300

## Running the tests

```shell
cd spotippos
bundle exec rake test
```
