#1/bin/bash

docker stop test && docker rm test && docker build -t easzlab.io.local:5000/dsz-blog-app:v1 . && docker run  -it -d --name test -p 8766:8000 -p 8764:8001 easzlab.io.local:5000/dsz-blog-app:v1 && docker logs test
