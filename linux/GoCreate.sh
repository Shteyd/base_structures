#!/bin/bash

function baseStruct {
    mkdir ./cmd
    mkdir ./pkg
    mkdir ./internal
    mkdir ./internal/config
    mkdir ./internal/core
    mkdir ./internal/service
    mkdir ./internal/storage
    mkdir ./internal/transport

    go mod init github.com/example/$name

    echo "package main">./cmd/main.go
    echo ".env">./.gitignore
    touch ./.env
    touch ./docker-compose.yml
    touch ./DockerFile
    echo "# $name">./README.md

    get few packages:
    go get -u github.com/joho/godotenv
    go get -u github.com/sirupsen/logrus
    go get -u github.com/spf13/viper
    go get -u github.com/jmoiron/sqlxe
    go get -u github.com/gin-gonic/gin
}

function createProject {
    echo "Enter project name:"
    read name

    mkdir ./$name
    cd $name

    baseStruct
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

echo $2

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