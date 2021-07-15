#!/bin/bash

# let's give the db some time to start up
sleep 10

cd /srv/fromthepage
bundle exec rake db:migrate
bundle exec rake assets:precompile
bundle exec rails server -b 0.0.0.0