#!/bin/bash

function reload
{
   git fetch
   git checkout -B master origin/master
}

function _RunPig
{
   pushd src > /dev/null 2>&1
   echo run -param dir=$1 main.pig | pig -x local
   popd > /dev/null 2>&1
}
function test { _RunPig ../test ; }
function real { _RunPig .       ; }

