#!/bin/bash
template=$1
k=$2
l=$3

sed "s;%k%;$2;g" $1 | sed "s;%l%;$3;g"

