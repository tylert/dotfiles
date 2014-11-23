#!/usr/bin/env bash

parent_repo="${1}"
child_repo="${2}"

did_parent_pushd=0
did_child_pushd=0

message="Import '${child_repo}' into '${parent_repo}' as a subtree."
echo ${message}

#if [ ! -d ${child_repo} ]; then
#    echo "Directory '${child_repo}' not found or is not readable."
#    exit 1
#else
#    pushd ${child_repo} 2>&1 > /dev/null
#    did_child_pushd=1
#fi
#
#if [ ! -d .git ]; then
#    echo "Directory '${child_repo}' does not contain a git repository."
#    exit 2
#fi
#
#if [ ! -d ${parent_repo} ]; then
#    echo "Directory '${parent_repo}' not found or is not readable."
#    exit 1
#else
#    pushd ${parent_repo} 2>&1 > /dev/null
#    did_parent_pushd=1
#fi
#
#if [ ! -d .git ]; then
#    echo "Directory '${parent_repo}' does not contain a git repository."
#    exit 2
#fi
#
#if [ -d ${child_repo} ]; then
#    exit "Subtree '${child_repo}' already exists under '${parent_repo}'."
#    exit 3
#else
    echo mkdir -p ${child_repo}
    echo git remote add -f temp_project ${child_repo}
    echo git merge --strategy=ours --no-commit temp_project/master
    echo git read-tree --prefix=${child_repo} -u temp_project/master
    echo git commit -m "${message}"
    echo git pull --strategy=subtree temp_project master
    echo git remote rm temp_project
#fi

# Put the directory stack back the way we found it.
#if [ 1 -eq ${did_child_pushd} ]; then
#    popd 2>&1 > /dev/null
#fi
#
#if [ 1 -eq ${did_parent_pushd} ]; then
#    popd 2>&1 > /dev/null
#fi
