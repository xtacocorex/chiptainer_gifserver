# BASE OFF THE PYTHON IO CHIPTAINER
FROM nextthingco/chiptainer_python_io

# INSTALL THE THINGS
RUN apk update && \
    # GIFSERVER SPECIFIC PACKAGES
    apk add py-flask && \
    apk add py-bottle && \
    # VU METER STUFF REQUIRED FOR CLAPTTO
    apk add git && \
    # CLAPTTO INSTALL
    git clone https://github.com/xtacocorex/claptto.git && \
    cd claptto && \
    cp -r gifserver / && \
    cd ../ && rm -rf claptto && \
    # Remove unneeded packages once build is complete.
    apk del git

# EXPOSE PORT 80 FOR THE GIFSERVER
EXPOSE 80

# THE ENTRY POINT
ENTRYPOINT echo "GIFSERVER IS STARTING" && \
    python gifserver/gifserver.py
