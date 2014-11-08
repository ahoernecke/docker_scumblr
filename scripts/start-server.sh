#!/bin/bash

source /etc/profile.d/rvm.sh

git clone https://github.com/Netflix/scumblr.git /scumblr 

cd /scumblr

if [ "$SCUMBLR_CREATE_DB" == "true" ]
then
  bundle exec rake db:create 
fi

if [ "$SCUMBLR_LOAD_SCHEMA" == "true" ]
  bundle exec rake db:schema:load
then

if [ "$SCUMBLR_RUN_MIGRATIONS" == "true" ]
  bundle exec rake db:migrate
then

bundle exec rake db:seed 
bundle exec rake assets:precompile
bundle exec unicorn -D -p 8080

redis-server &
sidekiq -l log/sidekiq.log &
nginx &

/bin/bash
