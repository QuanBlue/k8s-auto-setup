#!/bin/bash

# Source the environment file to load the variables
source ./env.sh

MASTER_NAME=${MASTER_NAME:-"master"}
WORKER_NAME_PREFIX=${WORKER_NAME_PREFIX:-"worker"}
WORKER_NUM=${WORKER_NUM:-2}
declare -A MACHINES=()

# install vagrant plugins
vagrant plugin install vagrant-env

# start vagrant
vagrant up

# get Master and Worker IP
MACHINES[${MASTER_NAME}]="$(VBoxManage guestproperty get ${MASTER_NAME} /VirtualBox/GuestInfo/Net/1/V4/IP | awk '{print $2}')"
for ((i = 1; i <= ${WORKER_NUM}; i++)); do
   MACHINES[${WORKER_NAME_PREFIX}${i}]="$(VBoxManage guestproperty get ${WORKER_NAME_PREFIX}${i} /VirtualBox/GuestInfo/Net/1/V4/IP | awk '{print $2}')"
done

# Print Nodes IP
for key in "${!MACHINES[@]}"; do
   echo "$key: ${MACHINES[$key]}"
done
