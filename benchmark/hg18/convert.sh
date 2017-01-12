#!/bin/sh
FILE=$1

cat $FILE | tr a-z A-Z | tr -d "\r\n"
