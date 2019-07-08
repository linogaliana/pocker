# `PockeR` <img src="./pics/pocker.png" align="right" width="120" />

<!-- badges: start -->
<!-- badges: end -->

Nothing related with poker game. `PockeR` is a `docker` container with both `Python` and `R`. They can interact with `Reticulate`, either using `R` source files or `Rmarkdown` engine. 

To execute only `Python` programs, this is not the most appropriate docker container. This repository is useful when expecting `Python` and `R` to work together. This container is an extension of `rocker/verse` container that integrates `Python 3.7` (using anaconda), `R` 3.5.1. version and also supports `C++` through `Rcpp`. 

The automatically built `Rmarkdown` is available [here](https://gitlab.com/linogaliana/pocker/-/jobs/artifacts/master/download?job=article). Examples of scripts (both source codes and markdown) are available in `/gitlabCI` and `/gitlabCI` directories. 

# How to use `pocker` image in continuous integration

This repository proposes two files that can be used as `.gitlab-ci.yml` in `gitlabCI` directory:

* `complete_configuration.yml`: if you want your CI in gitlab to start from the scratch (rocker image). This rebuilds the 
* `simple_configuration.yml`: if you want to skip the configuration. This is the one I use to generate [html files](https://gitlab.com/linogaliana/pocker/-/jobs/artifacts/master/download?job=article) testing `pocker` image

At this stage, when using `pocker` image, you should set `RETICULATE_PYTHON`  environment variable before trying to use `reticulate`. The following command in the beginning of a script should work:

```
Sys.setenv(RETICULATE_PYTHON = "/opt/conda/bin")
```

The `build.R` script is an example file that can be modified. 

# Installing a new `Python` module

Assuming you use gitlab CI, when you need to install a new module in `Python`, you have two possibilities:

* Run shell command in `.gitlab-ci.yml`: `conda install PACKAGENAME`
* Using reticulate within `R` or `Rmd` script: `reticulate::conda_install(packages = "PACKAGENAME")`

You can also, either using command line or reticulate functions, create new conda environments and switch between them.