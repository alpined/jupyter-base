
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
mkdir -p ~jupyter/.jupyter

cat > /home/jupyter/.jupyter/jupyter_notebook_config.py << '__EOF__'

import os

# Set a password if PASSWORD is set
if 'PASSWORD' in os.environ:
    if os.environ['PASSWORD'] != '' :
        from IPython.lib import passwd
        c.NotebookApp.password = passwd(os.environ['PASSWORD'])
    del os.environ['PASSWORD']
else:
    from IPython.lib import passwd
    c.NotebookApp.password = passwd('passw0rd')

__EOF__

chown -R jupyter.jupyter ~jupyter/.jupyter
