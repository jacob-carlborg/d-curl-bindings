# Static curl Bindings

This project contains static bindings for curl. The main purpose is to be able
to build fully statically linked binaries (including the C standard library on
supported platforms) which use curl as a library.

## Features

* All library dependencies are vendored (i.e. included in the repository)
* Only static libraries are supported
* Only BearSSL is supported as a TLS backend

## Build Requirements

* A D compiler
* Dub
* A C compiler
* autoconf 2.57 (or later)
* automake 1.7 (or later)
* libtool  1.4.2 (or later)
* GNU m4 (required by autoconf)
