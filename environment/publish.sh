SH_DIR=$(cd `dirname $0`; pwd)
cd $SH_DIR/..
git pull
rm -rf build && mkdir build
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
\cp -rf environment/docker/* build
\cp -rf web build
\cp -f glink build

docker stop glink
docker container rm glink
docker image rm glink
docker build -t glink build
docker run --network docker-net \
           --name glink \
           -d glink
