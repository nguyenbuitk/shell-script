#!/bin/bash

while ping -c 1 google.com >/dev/null
do
  echo "app1 still up..."
  sleep 5
done

echo "app1 down, continuing."
