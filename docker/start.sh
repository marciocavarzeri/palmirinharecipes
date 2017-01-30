#!/bin/sh

rm tmp/pids/server.pid > /dev/nulll 2>&1
rails db:migrate && rails server --port 80 --binding 0.0.0.0
