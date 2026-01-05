FROM alpine:latest

# Install nfs-utils (this includes rpcbind and the nfs server)
RUN apk add --no-cache nfs-utils bash

# Create the share directory
RUN mkdir -p /nfsshare && chmod 777 /nfsshare

# Copy the startup script
COPY run_nfs.sh /usr/local/bin/run_nfs.sh
RUN chmod +x /usr/local/bin/run_nfs.sh

# Expose NFS and RPC ports
EXPOSE 2049 111/udp 111/tcp

ENTRYPOINT ["/usr/local/bin/run_nfs.sh"]