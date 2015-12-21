GOPATH=$(shell pwd)/gopath/

godoc:
	GOPATH=${GOPATH} godoc -http=:6060

serve:
	#GOPATH=${GOPATH} go run

run:
	#GOPATH=${GOPATH} go run

package: build

tests:
	#GOPATH=${GOPATH} go test

install:
	#GOPATH=${GOPATH} go install

buildlinux32: getlinux32
	CGO_ENABLED=1 GOOS=linux GOARCH=386 GOPATH=${GOPATH} go build -o xxx_linux32 -a

buildlinux64: getlinux64
	CGO_ENABLED=1 GOOS=linux GOARCH=amd64 GOPATH=${GOPATH} go build -o xxx_linux64 -a

build: buildlinux32 buildlinux64 buildwin32 buildwin64

buildwin32: getwin32
	CXX=i686-w64-mingw32-g++ CC=i686-w64-mingw32-gcc CGO_LDFLAGS="-lssp" CGO_ENABLED=1 GOOS=windows GOARCH=386 GOPATH=${GOPATH} go build -o xxx_win32.exe -a

buildwin64: getwin64
	CXX=x86_64-w64-mingw32-g++ CC=x86_64-w64-mingw32-gcc CGO_LDFLAGS="-lssp" CGO_ENABLED=1 GOOS=windows GOARCH=amd64 GOPATH=${GOPATH} go build -o xxx_win64.exe -a

buildmac64: getmac64
	GOOS=darwin GOARCH=amd64 GOPATH=${GOPATH} go build -o xxx.mac64 -a

buildmac32: getmac32
	GOOS=darwin GOARCH=i686 GOPATH=${GOPATH} go build -o xxxx.mac64 -a

fmt:
	GOPATH=${GOPATH} go fmt

env:
	GOPATH=${GOPATH} go env

version:
	GOPATH=${GOPATH} go version

get:
	GOPATH=${GOPATH} go get -u golang.org/x/crypto/bcrypt

getlinux32:
	CGO_ENABLED=1 GOOS=linux GOARCH=386 make get

getlinux64:
	CGO_ENABLED=1 GOOS=linux GOARCH=amd64 make get

getwin32:
	CXX=i686-w64-mingw32-g++ CC=i686-w64-mingw32-gcc CGO_LDFLAGS="-lssp" CGO_ENABLED=1 GOOS=windows GOARCH=386 make get

getwin64:
	CXX=x86_64-w64-mingw32-g++ CC=x86_64-w64-mingw32-gcc CGO_LDFLAGS="-lssp" CGO_ENABLED=1 GOOS=windows GOARCH=amd64 make get

getmac32:
	CGO_ENABLED=1 GOOS=darwin GOARCH=i686 make get

getmac64:
	CGO_ENABLED=1 GOOS=darwin GOARCH=amd64 make get

getall: getlinux32 getlinux64 getwin32 getwin64
