#!/bin/bash
set -e # End running script if a mistake is made

mkdir -p /var/lib/nfs/v4recovery # If the system goes down try to serve clients who made requests before the crash (Unimplemented)

# Dynamically bind client port so that it can mount the server later on and wait for this process to start
rpcbind &
sleep 2

# Mount nfsd by specifying the type of mount on the given directory so communication can be done 
# However if the file has already been mounted it would give an error due to set -e so we use true to skip this portion
mount -t nfsd nfsd /proc/fs/nfsd || true

# * states that any client can access it. Can be limited by setting an IP address here
# rw ensures that clients can both read and write files
# fsid=0 sets the current directory as the root
# async allows us to slightly improve performance by notifying clients that there task was successful while the file is being read or written
# no_subtree_check prevents the server for checking if a file is in the right directory so a failure might prevent it from sending the file over
# no_root_squash allows clients to act as root users which is dangerous in production but docker has issues so clients have to be root users
# All this information is kept in a separate file
echo "/nfsshare *(rw,fsid=0,async,no_subtree_check,no_root_squash)" > /etc/exports

# Exports all directories from /etc/exports
exportfs -av

# Works as the communication medium so file retrieval and write in the network
# 8 stands for the number of threads ( can be varied )
rpc.nfsd 8

# Works as the middle man between client and server allowing client to mount a file
# -F keeps the process running on the system instead of background. Normally this should be fine but docker will switch off if no process is running in the system.
echo "NFS Server is running"
rpc.mountd -F