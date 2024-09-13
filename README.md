# Custom NPM package layer builder for aws lambda
Custom packages built for aws layer for DP lapp

## add node modules
add the packages to the `npm-package-list.txt`

### example
- w/o version numbers
```
axios
qrcode
```
- with version numbers
```
axios@^1.3.4
qrcode@^1.5.1
```
- with version numbers but w/o minor version increment
```
axios@1.3.4
qrcode@1.5.1
```

## TODO
- setup podman compose

# Docker

## Build
```properties
docker compose build --no-cache
docker compose up
```

## clean up
```properties
docker compose down
```

# Podman
```
# create a image with node setup
podman build ./docker/dockerfile

# create a container with volume npm-custom-builder
podman run -it -v $PWD:/npm-custom-builder -p 8080:8080 64c /bin/bash

# or attach to 
podman start e85
podman exec -t e85 /bin/bash
export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

cd /npm-custom-builder

sh pack-lsq-custom-layer.sh
```