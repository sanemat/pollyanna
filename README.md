# pollyanna

[![Build Status](https://api.travis-ci.org/sanemat/pollyanna.png?branch=master)](https://travis-ci.org/sanemat/pollyanna)
[![Code Climate](https://codeclimate.com/github/sanemat/pollyanna.png)](https://codeclimate.com/github/sanemat/pollyanna)
[![Coverage Status](https://coveralls.io/repos/sanemat/pollyanna/badge.png?branch=master)](https://coveralls.io/r/sanemat/pollyanna)
[![Dependency Status](https://gemnasium.com/sanemat/pollyanna.png)](https://gemnasium.com/sanemat/pollyanna)

## Requirement

- Ruby 2.0
- Node.js
- Postgresql
- ([qnyp/heroku-buildpack-ruby-bower](http://blog.qnyp.com/2013/05/30/say-hello-to-bower/))

## Setup

```
$ git clone git@github.com:sanemat/pollyanna.git
$ cd pollyanna
$ bundle
$ bower install
$ cp config/database.yml.example config/database.yml
$ cp .env.example .env
$ spring rake db:create db:schema:load
$ spring rails s
#=> rackup!
```

## Test

```
$ spring rake spec
```

## Heroku

```
$ heroku config:set \
  BUILDPACK_URL='git://github.com/qnyp/heroku-buildpack-ruby-bower.git#run-bower'
```
