#!/bin/bash

# Source the environment file to load the variables
source ./env.sh

MASTER_NAME=${MASTER_NAME:-"master"}
WORKER_NAME_PREFIX=${WORKER_NAME_PREFIX:-"worker"}
WORKER_NUM=${WORKER_NUM:-2}

# start master
VBoxManage startvm ${MASTER_NAME} --type headless

# start worker
for ((i = 1; i <= ${WORKER_NUM}; i++)); do
   VBoxManage startvm "${WORKER_NAME_PREFIX}$i" --type headless
done
