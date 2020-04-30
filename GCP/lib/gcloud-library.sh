#!/usr/bin/bash

function create_vm_instance() {

  MACHINE_NAME=$1
  SUBNET_NAME=$2
  DISK_SIZE=$3

  echo "Starting VM: ${MACHINE_NAME} on subnet ${SUBNET_NAME} with a ${DISK_SIZE} root disk."

  gcloud beta compute --project=rare-gist-275114 instances create ${MACHINE_NAME} \
  --zone=us-central1-a \
  --machine-type=n1-standard-1 \
  --subnet=${SUBNET_NAME} \
  --network-tier=PREMIUM \
  --maintenance-policy=MIGRATE \
  --service-account=427756866369-compute@developer.gserviceaccount.com \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --image=debian-9-stretch-v20200420 \
  --image-project=debian-cloud \
  --boot-disk-size=${DISK_SIZE} \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=${MACHINE_NAME} 
  if [ "$?" != 0 ]; then 
    echo "Failed to create: ${MACHINE_NAME}"
    exit 1
  else
    echo "${MACHINE_NAME}: Created successfully."
    exit 0
  fi

}

function create_network() {

	NETWORK_NAME=$1
	echo "Creating network named: ${NETWORK_NAME}"
	gcloud compute --project=rare-gist-275114 networks create ${NETWORK_NAME} \
	--subnet-mode=auto
}


function create_subnet() {
	SUBNET=$1
	NETWORK=$2
	RANGE=$3
	echo "Creating Subnet: ${SUB}, The network to which the subnetwork belongs is: ${NETWORK}, The IP space allocated to this subnetwork in CIDR format is: ${RANGE}"
	gcloud compute networks subnets create ${SUB}  \
	--network=${NETWORK} \ 
	--range=${RANGE}
}

function delete_vm_instance() {
	INSTANCE=$1
	echo "Deleting instance: ${INSTANCE}"
	gcloud compute instances delete ${INSTANCE}
}

function delete_subnet() {
	SUBNET_NAME=$1
	echo "Deleting Subnet: ${SUBNET_NAME}"
	gcloud compute networks subnets delete ${SUBNET_NAME}
}

function delete_network() {
	NETWORK=$1
	echo "Deleting Network: ${NETWORK}"
	gcloud compute networks delete ${NETWORK}
}