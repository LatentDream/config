#!/bin/bash

# Start the SSH agent
eval "$(ssh-agent -s)"

# Add the SSH key
ssh-add /home/dream/.ssh/host

# Connect to the remote host
ssh dream@latent.host

# Kill the SSH agent when done
ssh-agent -k
