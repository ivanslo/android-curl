#!/bin/bash

. settings.sh

BASEDIR=$(pwd)
TOOLCHAIN_PREFIX=${BASEDIR}/toolchain-android
OPENSSL=${BASEDIR}/openssl

for i in "${SUPPORTED_ARCHITECTURES[@]}"
do
  rm -rf ${TOOLCHAIN_PREFIX}
  ./openssl_build.sh $i $BASEDIR || exit 1
     ./curl_build.sh $i $BASEDIR || exit 1

  mkdir -p ${BASEDIR}/build/${i}/openssl
  cp ${OPENSSL}/libssl.a ${OPENSSL}/libcrypto.a ${BASEDIR}/build/${i}/openssl
done

rm -rf ${TOOLCHAIN_PREFIX}
