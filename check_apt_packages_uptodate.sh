#!/bin/bash

function getGithubVersion() {
    echo "Hello there"
}

function getAptVersion() {
    dpkg-query -W -f='${Version}\n' git | awk -F: '{print $2}' | cut -d'-' -f1
}

getGithubVersion
getAptVersion