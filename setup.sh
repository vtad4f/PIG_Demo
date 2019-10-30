#!/bin/bash

# install python 2.7.16
if [[ "$(python --version 2>&1)" != *'2.7.16'* ]]; then
   sudo yum update
   sudo yum install scl-utils
   sudo yum install centos-release-scl-rh
   sudo yum install python27
   sudo scl enable python27 bash
   export PYTHONPATH=/usr/lib/python2.7/site-packages/:$PYTHONPATH
else
   echo "python 2.7.16 is already installed"
fi

# download pig_util.py
if [[ ! -f src/pig_util.py ]]; then
   curl https://svn.apache.org/repos/asf/pig/trunk/src/python/streaming/pig_util.py -o src/pig_util.py
fi

# download large input file
if [[ -d in && ! -f in/movies.txt ]]; then
   cd in
   curl https://snap.stanford.edu/data/movies.txt.gz -o movies.txt.gz
   gunzip movies.txt.gz
   command rm -f movies.txt.gz
   cd -
elif [[ ! -d in ]]; then
   echo "Run 'mkdir in', then re-run setup.sh"
else
   echo "Large input file already exists"
fi

# clear read-only states
chmod -R 777 .

