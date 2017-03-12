#!/bin/bash
sudo chown -R deploy:deploy /app/psc-bookings
~/stop-psc-bookings && ~/start-psc-bookings
