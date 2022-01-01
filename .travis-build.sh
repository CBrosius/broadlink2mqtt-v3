#!/usr/bin/env bash
container="fredrickbacker/broadlink-mqtt-bridge"
export DOCKER_CLI_EXPERIMENTAL=enabled

# Login into docker
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USER" --password-stdin

architectures="amd64 x86_64 arm32v7 armhf arm64v8"

# Push image for every arch with arch prefix in tag
for arch in $architectures
do
# Build for all architectures and push manifest
  buildctl build --frontend dockerfile.v0 \
      --local dockerfile=. \
      --local context=. \
      --exporter image \
      --exporter-opt name=docker.io/$container:dev-$arch \
      --exporter-opt push=true \
      --frontend-opt arch=$arch \
      --frontend-opt filename=./Dockerfile &
done

wait

# manifest
#docker manifest create $container:dev \
#    $container:dev-arm \
#    $container:dev-armhf \
#    $container:dev-arm64 \
#    $container:dev-amd64

#for arch in $architectures
#do
#    docker manifest annotate $container:dev $container:dev-$arch --arch $arch    
#done
#docker pull $container:dev-arm
#docker tag $container:dev-arm $container:dev-armhf
#docker push $container:dev-armhf
#docker manifest annotate $container:dev $container:dev-armhf --arch armhf

#docker manifest push $container:dev

#docker pull $container:test-build-arm
#docker tag $container:test-build-arm $container:test-build-armhf
#docker push $container:test-build-armhf