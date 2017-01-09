#!/bin/bash

for((i=0;i<=50;i+=10)) do 
   sed "s;%l%;$i;g" template_incr-length.py > incr-length-${i}.py
done
