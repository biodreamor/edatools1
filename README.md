
# edatools1

<!-- badges: start -->
<!-- badges: end -->

The goal of edatools1 is to test how to build R package

## Installation

You can install the development version of edatools1 like so:

```r
if(!require(remotes))(
   install.packages("remotes")
)
remotes::install_github("rkabacoff/edatools")
```

## Example

This is a basic example which shows you how to describe a data frame:

``` r
library(edatools1)
df_info = contents(happiness)
```

