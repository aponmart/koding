#! /bin/bash

export GOPATH=$(cd "$(dirname "$0")"; pwd)

ldflags="-X koding/tools/utils.version $(git rev-parse HEAD)"

/usr/local/go/bin/go get -v -ldflags "$ldflags" koding/broker koding/kites/irc koding/alice

if [ $(uname) == "Linux" ]; then
  /usr/local/go/bin/go get -v -ldflags "$ldflags" koding/kites/os
fi

cp $GOPATH/bin/* $GOPATH/../kites
