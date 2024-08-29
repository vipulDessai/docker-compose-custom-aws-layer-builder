#!/bin/sh

packages=`cat npm-package-list.txt`

publicModulesZipFileName="aws-lambda-custom-npm-modules.zip"
publicModulesSrcFolderName="nodejs"
npmModuleFolderName="node_modules"

if [ -f "$publicModulesZipFileName" ]; then
    rm "$publicModulesZipFileName"
fi

if [ -d "$publicModulesSrcFolderName" ]; then
    rm -rf $publicModulesSrcFolderName
fi

mkdir $publicModulesSrcFolderName

InstallNPM () {
	export NODE_PATH=$NVM_DIR/versions/node/$1/bin
	export PATH=$NODE_PATH:$PATH

    read nodeVersion <<< $(node -v)
    nodeVersionFolderName="node${nodeVersion:1:2}"

    echo "Installing packages for node $nodeVersion"
    
    mkdir $publicModulesSrcFolderName/$nodeVersionFolderName
    cd $publicModulesSrcFolderName/$nodeVersionFolderName

    npm init -y

    for p in $packages
    do
    npm i $p
    done

    rm package-lock.json

    cd ../../
}

InstallNPM $NODE_VERSION_20

zip -r "$publicModulesZipFileName" "$publicModulesSrcFolderName"

rm -rf $publicModulesSrcFolderName