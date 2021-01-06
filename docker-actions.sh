#!/bin/bash

set -euo pipefail

echo "== Docker =="
echo "ArtifactId: $1"
echo "Version: $2"
echo "DockerHub Repo: $3"

echo "== Docker Build =="
mvn spring-boot:build-image -Dspring-boot.build-image.imageName=$1:$2 -Dmaven.test.skip=true
docker images

echo "== Docker Tag =="
docker tag $1:$2 $3:$2

echo "== Docker Push"
docker push $3:$2
