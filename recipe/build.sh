#!/bin/bash

set -xeuo pipefail

if [[ ${openssl} == "3" ]]; then
    # https://github.com/AGWA/git-crypt/issues/232#issuecomment-1144996281
    export CXXFLAGS="${CXXFLAGS} -DOPENSSL_API_COMPAT=0x30000000L"
fi

make
# no make check :-(
make install PREFIX=${PREFIX}
