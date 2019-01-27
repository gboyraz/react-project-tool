#!/bin/bash


POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -c|--component)
    COMPONENT="$2"
    shift # past argument
    shift # past value
    ;;

    -s|--storybookjs)
    STORYBOOKJS=YES
    shift # past argument
    ;;

    -m|--mobx)
    MOBX=YES
    shift # past argument
    ;;

    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

ROOT_DIR=$(pwd)
PROJECT_NAME=${POSITIONAL[0]}
PROJECT_DIR="${ROOT_DIR}/${PROJECT_NAME}"

if [ -z "${COMPONENT}" ]; then
    COMPONENT="SampleComponent"
fi