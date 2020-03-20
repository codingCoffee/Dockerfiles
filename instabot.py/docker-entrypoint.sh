#!/bin/sh

instabot-py -c config.yaml >> instabot.log &
tail -f instabot.log



