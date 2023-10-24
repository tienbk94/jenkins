#!/bin/bash

WORKSPACE=$1
IMAGE_NAME=$2
IMAGE_VERSION=$3
REPO_URL=$4
DOCKERFILE=$5

if [ "$IMAGE_NAME" == "develop-stock-sandbox" ]; then
    echo "sandbox image name = $IMAGE_NAME"
    sudo docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} --build-arg NAME_SPACE="sandbox" -f ${DOCKERFILE} .
else
    echo "trading image name = $IMAGE_NAME"
    sudo docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} --build-arg NAME_SPACE=${WORKSPACE} -f ${DOCKERFILE} .

fi
sudo docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ${REPO_URL}/${IMAGE_NAME}:${IMAGE_VERSION}
sudo docker push ${REPO_URL}/${IMAGE_NAME}:${IMAGE_VERSION}
