#!/bin/bash

cd /scumblr
source /etc/profile.d/rvm.sh

bundle exec unicorn -D -p 8080
redis-server &
sidekiq -l log/sidekiq.log &
nginx
