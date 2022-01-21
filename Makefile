.PHONY: rebuild serve clean

CWD=$(shell pwd)
TAG="kcghst/sonos-web:latest"

# Build the production vue bundle in client/, which really just creates a set of
# client side javascript and assets, and stuff that in server/ before starting
# the full backend.
# This is mostly equivalent to what sonos-web-cli does.

serve: out/built.stamp
	cd out && NODE_ENV="production" node src/server.js

client/dist.tar:
	cd client && npm install
	cd client && node_modules/.bin/vue-cli-service build
	cd client && tar -cf dist.tar dist/

rebuild:
	$(MAKE) -B out/built.stamp

out/built.stamp: client/dist.tar
	cd server && npm install
	mkdir -p out
	cd out && tar -xf ../$<
	cp server/.env.production out/.env
	cp -rf server/src out/
	cp -rf server/node_modules out/
	cp -rf client/dist out/
	touch $@

server-image: server-image.stamp

# This is NOT a docker image for building the project. (should make one, but the official node image falls down on node-fibers)
# This is instead a minimal Docker image for hosting a pre-built sonos-web, with client and npm modules pre-installed
server-image.stamp: Dockerfile.server out/built.stamp
	docker build --tag $(TAG) -f $< $(CWD)
	touch $@

clean:
	rm -rf client/node_modules
	rm -rf client/dist
	rm -rf server/node_modules
	rm -rf server/dist
	rm -rf out
