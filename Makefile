.PHONY: serve clean

# Build the production vue bundle in client/, which really just creates a set of
# client side javascript and assets, and stuff that in server/ before starting
# the full backend.
# This is mostly equivalent to what sonos-web-cli does.

serve: server/.env server/dist server/node_modules
	cd server && NODE_ENV="production" node src/server.js

server/.env:
	cp server/.env.production $@

server/dist: client/dist
	cp -rf client/dist/ server/

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
	rm -f server/.env
