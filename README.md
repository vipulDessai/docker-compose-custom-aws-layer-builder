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

## Build
```properties
docker compose build --no-cache
docker compose up
```

## clean up
```properties
docker compose down
```