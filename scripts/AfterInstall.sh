#!/bin/bash
source ~/environments
cd /app/psc-bookings/
~/.rbenv/shims/bundle exec rake db:migrate
