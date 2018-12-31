# sonos-web
Sonos Web is a browser based controller for your [Sonos](https://www.sonos.com/system) sound system.

Install Sonos Web on a single computer and access and manage your system from any browser on your network.

![Now Playing](https://user-images.githubusercontent.com/5977736/50566780-999be980-0cfa-11e9-8085-d11eec234315.png)

Sonos Web relies upon the [node-sonos](https://github.com/bencevans/node-sonos) project for all its Sonos communication.

## Features
Sonos Web is a developing project and is not yet full-featured. Here are some of the currently available features:
 * Group rooms together via drag & drop
 * Party mode (Group all speakers into one group)
 * Quickly & easily switch between rooms/groups
 * Queue management via icon on Now Playing bar
 * Adjust individual speaker volume/mute or adjust for the whole group 
 * Play, pause, skip, and seek tracks
 * Shuffle & repeat controls 
 * Room selection from the Now Playing bar.

## Coming Soon
 * Browse music library by artist, album, genre, playlist, etc.
 * Search your entire music library  

## Install
The goal for this project is to make installation as simple as possible for Windows, Mac, & Linux.

To this end, **sonos-web-cli** was created to be able to install Sonos Web by a single command in your terminal.

If you do not already have npm installed, you must do so [here](https://www.npmjs.com/get-npm) before continuing.
If you are on Linux, the best way is to install node from source [here](https://github.com/nodesource/distributions)

Once npm is installed, run the following commands in your terminal to get started:
- `npm install -g sonos-web-cli`
- `sonos-web install` (Installs and starts Sonos Web)
- Open a browser to `http://localhost:5050` and enjoy!

Run `sonos-web --help` for more options

## Screenshots
### View all rooms and what they're playing
![Rooms](https://user-images.githubusercontent.com/5977736/50566842-5c842700-0cfb-11e9-8e7b-56a981769d26.png)

### Adjust volume as a group or as individual rooms
![Grouped Rooms & Individual Volume Adjustment](https://user-images.githubusercontent.com/5977736/50566804-fdbead80-0cfa-11e9-86c9-21290ff33288.png)

### Queue Management
![Queue Management](https://user-images.githubusercontent.com/5977736/50566855-89d0d500-0cfb-11e9-8c7c-181a624b5eb7.png)


## Issues or Questions
If you have any issues or a questions feel free to [open an issue](https://github.com/Villarrealized/sonos-web/issues/new)

## Support
Suggestions and feedback are always welcome. 

If you like Sonos Web and would like to help fund further development of this project, you can do so through Beerpay.
[![Beerpay](https://beerpay.io/Villarrealized/sonos-web/badge.svg?style=beer)](https://beerpay.io/Villarrealized/sonos-web)

If there is a feature you would like to see developed you can also make a wish!
[![Beerpay](https://beerpay.io/Villarrealized/sonos-web/make-wish.svg?style=flat)](https://beerpay.io/Villarrealized/sonos-web)

## License
[GPL v3.0](https://github.com/Villarrealized/sonos-web-cli/blob/master/LICENSE)
