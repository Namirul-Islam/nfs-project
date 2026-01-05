#!/bin/bash

# 1. Wait a few seconds for the NFS server to start and be ready
echo "Waiting for NFS server to initialize..."
sleep 5

# Mount using nfs protocol
# NFS locks files so that two people do not modify the same file
# However docker has issues with the lock manager so we ensure a no lock procedure
echo "Attempting to mount nfs-server:/nfsshare..."
mount -t nfs -o nolock nfs-server:/nfsshare /mnt/distributed_data

# Ensure that the task was successful
if [ $? -eq 0 ]; then
    echo "Successfully mounted distributed storage!"
else
    echo "Mount failed. Check if server is running and privileged mode is on."
fi

# Keep the docker container running on the system otherwise it will exit
tail -f /dev/null