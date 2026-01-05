FROM alpine:latest

# Install nfs-utils for the mount command and bash for the script
RUN apk add --no-cache nfs-utils bash

# Create the directory where the shared data will live
RUN mkdir -p /mnt/distributed_data

# Copy the entrypoint script from your computer into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Tell Docker to run this script when the container starts
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]