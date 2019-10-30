#!/bin/bash

function reload
{
   git fetch
   git checkout -B master origin/master
}

function _RunPig
{
   pushd src > /dev/null 2>&1
   echo run main.pig -param dir=../test | pig -x local # 2> /dev/null
   popd > /dev/null 2>&1
}
function test { _RunPig ../test ; }
function real { _RunPig .       ; }

