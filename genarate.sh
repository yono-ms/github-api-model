#!/bin/bash

GENERATOR_VERSION=7.21.0
JAR=openapi-generator-cli-$GENERATOR_VERSION.jar

if [ ! -f "$JAR" ]; then
  echo "Downloading OpenAPI Generator..."
  curl -L -o $JAR https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$GENERATOR_VERSION/$JAR
fi

rm -rf src

java -jar $JAR generate \
  -i openapi.yaml \
  -g kotlin \
  -o . \
  --global-property models,modelTests=false \
  --additional-properties=packageName=io.github.yono_ms.model,serializationLibrary=kotlinx_serialization
