#!/bin/bash
if [ $# -ge 1 ] ; then
    cp ~/arbete/resources/python/stub.py ./${1}
    vim ./${1}
else
    echo "error: provide filename"
fi
