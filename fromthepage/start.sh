#!/bin/bash

# let's give the db some time to start up
sleep 10

cd /srv/fromthepage
bundle exec rake db:migrate
bundle exec rails server