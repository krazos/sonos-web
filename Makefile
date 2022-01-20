.PHONY: build serve clean

# Build the production vue bundle in client/, which really just creates a set of
# client side javascript and assets, and stuff that in server/ before starting
# the full backend.
# This is mostly equivalent to what sonos-web-cli does.

serve: out/built.stamp
	cd out && NODE_ENV="production" node src/server.js

build:
	$(MAKE) -B out/built.stamp

out/built.stamp:
	cd client && npm install
	cd server && npm install
	cd client && node_modules/.bin/vue-cli-service build
	mkdir -p out
	cp server/.env.production out/.env
	cp -rf server/src out/
	cp -rf server/node_modules out/
	cp -rf client/dist out/
	touch $@

clean:
	rm -rf client/node_modules
	rm -rf client/dist
	rm -rf server/node_modules
	rm -rf server/dist
	rm -rf out
