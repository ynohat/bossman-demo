#!/bin/sh

ls envs/*/*.jsonnet |
  while IFS=/ read _ tplName envFile; do
    envName=$(basename $envFile .jsonnet)
    echo "> Rendering $tplName/$envName..."
    jsonnet -cm ./dist -J ./lib \
      --ext-code-file env=./envs/${tplName}/${envFile} \
      --ext-code-file globals=./globals.jsonnet \
      ./templates/${tplName}.jsonnet
    echo
  done

echo "> Rendering Cloudlets..."
jsonnet -cm ./dist -J ./lib \
  --ext-code-file globals=./globals.jsonnet \
  ./templates/cloudlets.jsonnet
