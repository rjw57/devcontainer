#!/bin/bash
set -ex -o pipefail

[ -z "${TARGETARCH}" ] && (echo "TARGETARCH not set" >&2; exit 1)
[ -z "${GOLANG_RELEASE}" ] && (echo "GOLANG_RELEASE not set" >&2; exit 1)

if [ "${TARGETARCH}" = "amd64" ]; then
  golang_arch="amd64"
else
  echo "Unknown target architecture for golang install: ${TARGETARCH}" >&2
  exit 1
fi

golang_url="https://go.dev/dl/go${GOLANG_RELEASE}.linux-${golang_arch}.tar.gz"
curl -L "${golang_url}" | tar -C ~/ -xz
