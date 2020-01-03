#!/bin/sh

while true; do
  bugwarrior-pull
  task sync
  sleep 60
done

