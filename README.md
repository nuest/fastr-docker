# FastR Dockerfile

> [FastR](https://github.com/oracle/fastr) is an implementation of the R Language in Java atop [Truffle](https://github.com/oracle/graal/blob/master/truffle/README.md), a framework for building self-optimizing AST interpreters. FastR is be polyglot, efficient, and compatible. ([source](https://github.com/oracle/fastr/blob/master/README.md))

![Docker Automated build](https://img.shields.io/docker/automated/nuest/fastr.svg) ![Docker Build Status](https://img.shields.io/docker/build/nuest/fastr.svg) [![](https://images.microbadger.com/badges/image/nuest/fastr.svg)](https://microbadger.com/images/nuest/fastr "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/nuest/fastr.svg)](https://microbadger.com/images/nuest/fastr "Get your own version badge on microbadger.com")

## Build locally

```bash
docker build --tag fastr .
```

## Use

```bash
docker run --rm -it fastr

# run specific command
docker run --rm -it fastr -e "sessionInfo()"
```

By default, the Graal compiler is active.
You can disable it by defining your own entrypoint and command:

```bash
docker run --rm -it --entrypoint mx fastr R
```

The following shows a comparison of the feature - further tests welcome, see #3

```bash
# with Grall compiler (default)
docker run --rm -it fastr -q -e 'install.packages("microbenchmark", quiet = TRUE); cat("Run benchmark...\n"); microbenchmark::microbenchmark("unique list" = { for (i in 1:10000) unique(1:i) }, times = 25, unit = "s")'
```

Output _with_ Graal compiler:

```
> install.packages("microbenchmark", quiet = TRUE); cat("Run benchmark...\n"); microbenchmark::microbenchmark("unique list" = { for (i in 1:10000) unique(1:i) }, times = 25, unit = "s")
Updating HTML index of packages in '.Library'
Making 'packages.html' ... done
Run benchmark...
Unit: seconds
        expr       min        lq     mean    median       uq      max neval
 unique list 0.7662038 0.7964194 1.057809 0.9022891 1.121864 3.433876    25
```

```bash
# without
docker run --rm -it --entrypoint mx fastr R -e 'install.packages("microbenchmark", quiet = TRUE); cat("Run benchmark...\n"); microbenchmark::microbenchmark("unique list" = { for (i in 1:10000) unique(1:i) }, times = 25, unit = "s")'
```

Output _without_ Graal compiler:

```
> install.packages("microbenchmark", quiet = TRUE); cat("Run benchmark...\n"); microbenchmark::microbenchmark("unique list" = { for (i in 1:10000) unique(1:i) }, times = 25, unit = "s")
Updating HTML index of packages in '.Library'
Making 'packages.html' ... done
Run benchmark...
Unit: seconds
        expr      min      lq     mean   median       uq      max neval
 unique list 1.280034 1.38484 1.505686 1.482067 1.551866 2.120451    25
```

Notice the differences between `median`/`mean` and `max`/`min`, i.e. the speed up occurring after a longer first execution if using the Graal compiler.
The difference gets more obvious with higher repetition numbers (parameter `times`).

## Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md) (file `CODE_OF_CONDUCT.md`).
By participating in this project you agree to abide by its terms.

## License

FastR is available under the GPLv2 license.

Code files in this repository are published under GPLv3 and are Copyright (C) 2017 Daniel Nüst, see LICENSE for the full text of the license.