#!/bin/bash

echo "Enter project name: "
read name

[ -d $name ] cd ./$name

cd ./lib
rm -r ./utils
rm -r ./presentation
rm -r ./domain
rm -r ./data
