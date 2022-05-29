#!/bin/bash

function baseStruct () {
    [ -d $1 ] cd ./$1

    cd ./lib

    mkdir ./utils
    mkdir ./presentation
    mkdir ./presentation/pages
    mkdir ./presentation/widgets
    mkdir ./domain
    mkdir ./domain/features
    mkdir ./data
    mkdir ./data/features
    mkdir ./data/api
    mkdir ./data/db
    mkdir ./data/utils
}

function createProject {
    echo "Enter project name (snake_case):"
    read name

    flutter create $name
    baseStruct $name
}

function getHelp {
    echo "-h, --help"
    echo -e "\tPrints out the help menu.\n"
    echo "-n, --new"
    echo -e "\tCreate new project.\n"
    echo "without flags"
    echo -e "\tCreate base struct in project.\n"

    exit 0
}

echo
while [ -n "$1" ]
do
    case "$1" in
        -h) getHelp ;;
        --help) getHelp ;;
        -n) createProject ;;
        --new) createProject ;;
    esac
    shift
done

baseStruct