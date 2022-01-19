.PHONY: serve clean

# Build the production vue bundle in client/, which really just creates a set of
# client side javascript and assets, and stuff that in server/ before starting
# the full backend.
# This is mostly equivalent to what sonos-web-cli does.

serve: out/.env out/dist out/src out/node_modules
	cd out && NODE_ENV="production" node src/server.js

out:
	mkdir $@

out/.env: server/.env.production | out
	cp $< $@

out/src: server/src | out
	cp -rf $< out/

out/node_modules: | server/node_modules out
	cp -rf server/node_modules out/	

out/dist: client/dist
	cp -rf client/dist out/

client/dist: client/node_modules/.bin/vue-cli-service
	cd client && node_modules/.bin/vue-cli-service build

client/node_modules/.bin/vue-cli-service: | client/node_modules

# WARNING: npm install uses package.json wildcard package dependencies
# So the installed apckages can change over time. Use 'npm ci' to use
# package.lock hardset dependencies instead
client/node_modules:
	cd client && npm install

server/node_modules:
	cd server && npm install

server: | server/node_modules
	cd server && node src/server.js

clean:
	rm -rf client/node_modules
	rm -rf client/dist
	rm -rf server/node_modules
	rm -rf server/dist
	rm -rf out

