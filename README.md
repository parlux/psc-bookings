# PSC Bookings

This is the bookings engine for PSC, allowing students to book rooms and gear, and staff to manage these bookings.

#### Dev setup

We're running in docker, so the idea is:

`docker compose build`

`docker compose up`

If it's the first time you're running it, you'll need to create some databases

`docker compose run web bundle exec rake db:create`

If you're getting an error message such as the rails server is already running, just rm _tmp/pids/server.pid_

