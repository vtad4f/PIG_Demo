#!/bin/bash

git fetch
git checkout -B master origin/master

cd src
echo run main.pig | pig -x local 2> /dev/null
cd -

