#!/bin/bash
sudo chown -R deploy:deploy /app/psc-bookings
source ~/.bash_profile
source ~/environments
cd /app/psc-bookings/
bundle install
bundle exec rake db:migrate
~/stop-psc-bookings && ~/start-psc-bookings
