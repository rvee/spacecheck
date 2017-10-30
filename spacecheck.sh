#!/bin/bash

function testpath {
  echo "Checking $1"
  val=`sudo du -xh --max-depth=1 $1 | sort -h | tail -n 4`
  echo "$val"
  nextpath=`echo "$val" | tail -n2 | head -n1 | cut -f2`
}

if [ -z $1 ]
then
    testpath "/"
else
    testpath $1
fi
testpath $nextpath
testpath $nextpath
