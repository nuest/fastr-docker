# FastR Dockerfile

> [FastR](https://github.com/oracle/fastr) is an implementation of the R Language in Java atop [Truffle](https://github.com/oracle/graal/blob/master/truffle/README.md), a framework for building self-optimizing AST interpreters. FastR is be polyglot, efficient, and compatible. ([source](https://github.com/oracle/fastr/blob/master/README.md))

![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg) ![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg) [![](https://images.microbadger.com/badges/image/nuest/fastr.svg)](https://microbadger.com/images/nuest/fastr "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/fastr.svg)](https://microbadger.com/images/nuest/fastr "Get your own version badge on microbadger.com")

## Build locally

```bash
docker build --tag fastr .

docker run --rm -it fastr
```

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md) (file `CODE_OF_CONDUCT.md`).
By participating in this project you agree to abide by its terms.

## License

FastR is available under the GPLv2 license.

Code files in this repository are published under GPLv3 and are Copyright (C) 2017 Daniel Nüst, see LICENSE for the full text of the license.