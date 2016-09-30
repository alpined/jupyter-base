
# install python
apk add --no-cache python3 libzmq bash

# install build layer
apk add --no-cache --virtual .build-deps build-base python3-dev

# get jupyter
python3 -m pip install --no-cache-dir --upgrade pip
python3 -m pip install --no-cache-dir --upgrade jupyter bash_kernel
python3 -m bash_kernel.install

# destroy build layer
apk del .build-deps

adduser -D jupyter
