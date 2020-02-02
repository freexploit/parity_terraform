#!/bin/bash

echo -n "Building PACKER image"

docker run -it -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v $(pwd)/packer:/packer radar/packer-builder:latest build parity-instance.json

echo -n "Applying Terraform"

docker run -it -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -v $(pwd)/terraform:/terraform radar/terraform-builder:latest apply -auto-approve
