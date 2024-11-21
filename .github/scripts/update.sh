#!/usr/bin/env bash

PACKAGE_NAME=squid; 
PACKAGE_ARCH=x86_64; 
ALPINE_VERSION=$(curl -SsL https://raw.githubusercontent.com/digrouz/docker-alpine-s6/master/Dockerfile_alpine |\
                 grep "FROM alpine:" |\
                 awk '{print $2}'|\
                 sed  -E "s|alpine:||" |\
                 awk -F '.' '{print $1"."$2}'\
                )

NEW_VERSION=$(curl -SsL https://pkgs.alpinelinux.org/package/v${ALPINE_VERSION}/main/${PACKAGE_ARCH}/${PACKAGE_NAME} |\
              grep -i -A 3 Version |\
              tail -1 | \
              awk '{print $1}'\
             )

if [ "${NEW_VERSION}" ]; then
  sed -i -e "s|ARG ${PACKAGE_NAME^^}_VERSION=.*|ARG ${PACKAGE_NAME^^}_VERSION='${NEW_VERSION}'|" Dockerfile_alpine
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else
  # Uncommitted changes
  git commit -a -m "Updated Package ${PACKAGE_NAME} to version: ${NEW_VERSION}"
  git push
fi
