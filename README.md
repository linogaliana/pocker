# `PockeR` <img src="./pics/pocker.png" align="right" width="120" />

<!-- badges: start -->
<!-- badges: end -->

Nothing related with poker game. `PockeR` is a `docker` container with both `Python` and `R`. They can interact with `Reticulate`, either using `R` source files or `Rmarkdown` engine. 

To execute only `Python` programs, this is not the most appropriate docker container. This repository is useful when expecting `Python` and `R` to work together. This container is an extension of `rocker/verse` container that integrates `Python 3.7` (using anaconda), latest available `R` version and also supports `C++` through `Rcpp`. The automatically built `Rmarkdown` is available [here](https://gitlab.com/linogaliana/pocker/-/jobs/artifacts/master/download?job=article)

Assuming you use gitlab CI, when you need to install a new module in `Python`, you have two possibilities:

* Run shell command in `.gitlab-ci.yml`: `conda install PACKAGENAME`
* Using reticulate within `R` or `Rmd` script: `reticulate::conda_install(packages = "PACKAGENAME")`