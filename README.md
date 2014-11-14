# wikia-workshops-vagrant

Repository with vagrant package for workshops organized by Wikia and vendors.

## Requirements


* Virtualbox
* Internet connection

## Get started

1. [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. [Install Vagrant](http://downloads.vagrantup.com/tags/v1.3.5)
3. [Download this repository](https://github.com/nandy-andy/workshops-vagrant/archive/workgate-2014.zip)
4. Run vagrant up in a terminal
5. Open `http://127.0.0.1:8080/` in your browser

## Features

* Apache2
* MySQL
* PHP5
* Memcache(d)
* XDebug
* Webgrind

## Usage

* Run `vagrant ssh` to login to your development environment
* Add `XDEBUG_PROFILE` parameter to `GET`/`POST`/`cookie` while visiting `127.0.0.1:8080` sites to generate cachegrind files which later you can analyze in `127.0.0.1:8080/webgrind/`
