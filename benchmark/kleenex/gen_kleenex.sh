#!/bin/bash
template=$1
k=$2

sed "s;%k%;$2;g" $1
