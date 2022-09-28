#!/bin/bash
cd /var/lib/jenkins/workspace/recom

RESOURCE_NAME=$( jq -r '.[].content.overview.resourceName' < idleimages.json )

gcloud compute images delete $RESOURCE_NAME