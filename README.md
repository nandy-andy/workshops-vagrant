# wikia-workshops-vagrant

Repository with vagrant package for workshops organized by Wikia and vendors.

## Requirements


* Virtualbox
* Internet connection

## Get started

1. Install Virtualbox
2. Clone this repository
3. Run vagrant up in a terminal
4. Open `http://127.0.0.1:8080/` in your browser

## Features

* Apache2
* MySQL
* PHP5
* XDebug
* Webgrind
* node
* npm

## Usage

* Run `vagrant ssh` to login to your development environment
* Add `XDEBUG_PROFILE` parameter to `GET`/`POST`/`cookie` while visiting `127.0.0.1:8080` sites to generate cachegrind files which later you can analyze in `127.0.0.1:8080/webgrind/`

## TODO
- [x] install memcached,
- [ ] install memcached client,
- [x] after cloning blog application repo checkout workgate-2014 branch
