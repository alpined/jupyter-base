
# install build layer
apk add --no-cache --virtual .build-deps gcc make musl-dev curl ca-certificates

# build smell-baron
curl -sSL https://raw.githubusercontent.com/ohjames/smell-baron/master/main.c -o /tmp/smell-baron.c
gcc -std=c99 -DNDEBUG -O3 /tmp/smell-baron.c -o /bin/smell-baron

# destroy build layer
apk del .build-deps
