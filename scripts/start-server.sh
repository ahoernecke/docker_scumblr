#!/bin/bash

source /etc/profile.d/rvm.sh

git clone https://github.com/Netflix/scumblr.git /scumblr 

cd /scumblr

bundle exec rake db:create 
bundle exec rake db:schema:load
bundle exec rake db:seed 
bundle exec rake assets:precompile
bundle exec unicorn -D -p 8080

redis-server &
sidekiq -l log/sidekiq.log &
nginx &

/bin/bash
