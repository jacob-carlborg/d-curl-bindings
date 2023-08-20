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

## Contributing

### Generate curl Bindings

[DStep](https://github.com/jacob-carlborg/dstep) is used to generate the curl
bindings. Run the following command to regenerate the bindings:

```
./tools/generate_bindings.sh
```

If DStep is not installed in a standard location, the `DSTEP` environment
variable can be used to specify the location of DStep:

```
DSTEP="path/to/dstep" ./tools/generate_bindings.sh
```

### Update Dependencies

The dependencies of the curl bindings (including curl itself) are included in
the repository using git subtree. To update a dependency, run the following
command:

```
./tools/sync_subtree.sh <dependency> <version>
```

Where `<dependency>` is any of the subdirectories in the `vendor` directory and
`<version>` is a git reference.
