#!/bin/bash
sudo chown -R deploy:deploy /app/psc-bookings
source ~/environments
cd /app/psc-bookings/
~/.rbenv/shims/bundle exec rake db:migrate
