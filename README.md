
<!-- README.md is generated from README.Rmd. Please edit that file -->

# collisionsDE

<!-- badges: start -->

<!-- badges: end -->

collisionsDE is a R library to simplify the use of the publicly
available collision data from the German Federal Statistical Office

## Installation

You can install the released version of collisionsDE from
[GitHub](https://github.com) with:

First, you need to install the devtools package. You can do this from
CRAN. Invoke R and then type:

``` r
install.packages("devtools")
```

Load the devtools package.

``` r
library("devtools")
```

Now you can download the package with:

``` r
install_github("lutzhutz/collisionsDE")
```

## Example

Download all reported collisions of 2018

``` r
library(collisionsDE)

collisions_2018<-import_2018()
```

Add regional information to each of the collisions

``` r
collisions_2018_regions<- add_regions(collisions_2018)
```
