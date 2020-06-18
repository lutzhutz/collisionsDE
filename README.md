
<!-- README.md is generated from README.Rmd. Please edit that file -->

# collisionsDE

<!-- badges: start -->

<!-- badges: end -->

collisionsDE is a R library to simplify the use of the publicly
available [collision
data](https://unfallatlas.statistikportal.de/_opendata2019.html) from
the [German Federal Statistical
Office](https://www.destatis.de/DE/Home/_inhalt.html)

**WARNING:** This package is under development. Full functionality is
not guaranteed\!

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

Download all reported collisions of 2018 (if save = TRUE data frame will
be saved as text file)

``` r
library(collisionsDE)

collisions_2018 <- import_2018(save = FALSE)
```

Add regional information to each of the collisions

``` r
collisions_2018_regions <- add_regions(collisions_2018)
```

Extract all collisions with cyclist participation

``` r
collisions_2018_regions_cyclist <- collisions_2018_regions[collisions_2018_regions$IstRad == 1,]
```

Add new column “coll\_typ” giving information about which transport
modes have collided (three = TRUE means all collisions with two or more
transport modes involved are assigned a new group calles “three”).

``` r
collisions_2018_collision_types <- add_collision_types(collisions_2018, three = TRUE)
```
