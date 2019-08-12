#!/bin/bash

file="./amplify/backend/storage/s3fe2f9349/parameters.json"

if [ -z "$RESULT_BUCKET_SUFFIX" ]; then
  rand=`dd if=/dev/urandom bs=9 count=1 2>/dev/null | base64 | tr '+/' 'a'| tr '[:upper:]' '[:lower:]'`
  suffix="aa-$rand"
  echo "Using new prefix: $suffix"
else
  echo "Using exiting prefix: $RESULT_BUCKET_SUFFIX"
  suffix="$RESULT_BUCKET_SUFFIX"
fi
sed -i "s/aws-athena-query-results[^\"]*/aws-athena-query-results-$suffix/" $file