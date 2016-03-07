#!/bin/bash

find $HOME/.elinks -type f ! -name bookmarks -delete
find $HOME/.w3m -type f -delete
find $HOME/.pentadactyl/info/default -type f -delete
find $HOME/local/tor-browser_en-US/Browser/.pentadactyl/info/default -type f -delete
