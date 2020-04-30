#!/usr/bin/env bash
# Use this script to delete Instance, Subnet and Network

# Take in all our functions for GCP
source lib/gcloud-library.sh

# delete_subnet: SUBNET_NAME
# delete_instance: INSTANCE
# delete_network: NETWORK

delete_vm_instance 'instance-3'
delete_subnet 'eransub'
delete_network 'testnet'