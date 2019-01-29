#!/bin/bash

PROJECT_NAME='notebook-ml'

# Create the base-container project that contains the images
oadm new-project $PROJECT_NAME --display-name=$PROJECT_NAME

oc create -f deployments/notebook-build.yaml -n $PROJECT_NAME
oc create -f deployments/notebook-template.yaml -n $PROJECT_NAME

#oc start-build notebook-ml -n $PROJECT_NAME