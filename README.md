
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

This is a basic example which shows you how to solve a common problem:

``` r
library(collisionsDE)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
