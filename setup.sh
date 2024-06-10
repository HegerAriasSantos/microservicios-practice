#!/bin/bash

# Update all submodules

echo "Updating Submodules"
git submodule update --init --recursive
echo "Submodules Updated Successfully!"

# Install all node_modules

directories=(
    ./client-gateway
    ./products-microservice
    ./orders-microservice
)

for directory in "${directories[@]}"; do
    cd $directory
    echo "Installing Node_modules from $directory"
    npm install
    cd .. 
done

echo "All Pacakages Installed Successfully!"

# create .env file for all microservices from .env.template 

cp .env.template .env

for directory in "${directories[@]}"; do
    cd $directory
    echo "Creating .env file for $directory"
    cp .env.template .env
    cd ..
done

echo ".env files created successfully!"

# Build all microservices

docker comnpose up --build 


