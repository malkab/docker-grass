#!/bin/bash

# Pushes production image to DockerHub

docker login
docker push malkab/grass:dangerous_deer
