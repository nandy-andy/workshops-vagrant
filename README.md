wikia-workshops-vagrant
=======================

Repository with vagrant package for workshops organized by Wikia and vendors.

Requirements
============
# Virtualbox
# Internet connection

Get started
===========
# Install Virtualbox
# Clone this repository
# Run vagrant up in a terminal
# Open http://127.0.0.1:8080/ in your browser

Features
========
# Apache2
# MySQL
# PHP5
# XDebug
# Webgrind

Usage
=====
# Run vagrant ssh to login to your development environment
# Add XDEBUG_PROFILE parameter to GET/POST/cookie while visiting 127.0.0.1:8080 sites to generate cachegrind files which later you can analyze in 127.0.0.1:8080/webgrind/
