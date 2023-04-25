
## ddspWQ

The `{ddspWQ}` package is a low dependency package designed to help
interact with the [‘Defra Data Services Platform Water Quality
Archive’](https://environment.data.gov.uk/water-quality/view/doc/reference)
(ddspwqa herein)

## Installation

To install the latest release of `{ddspWQ}` use the following code:

``` r
install.packages("devtools")
library(devtools)
install_github("a-jone5/ddspWQ")
library(ddspWQ)
```

## Functions

Functions in the `{ddspWQ}` package are currently split into either
`helper` or `fetch` functions:

- `helper` functions are designed to help you understand more details
  about the arguments you will use in the ‘fetch’ functions

  - `helper_dets` helps you find the codes for the determinands you are
    interested in

- `fetch` functions are designed to pull data via the ddspwqa API

  - `fetch_sample_points` pulls in the sample points based on the
    arguments you provide

  - `fetch_sample_res` pulls in the sample results for the sample points
    you provide

## Workflow

Lets say we are interested in finding out some water quality data
looking at zinc concentrations.

We can call the following to see what zinc dets the ddspwqa has data for

``` r
library(ddspWQ)

zinc_dets <- helper_dets("zinc")

head(zinc_dets)
```

we can store the results in a dataframe for ease of scrolling around. We
decide we are interested in looking at dissolved Zn with the “det code”
**3408**.

We now decide we want to look at some old abandoned mining areas, to
have a look at dissolved zinc concentrations. To do that we are going to
need to know what sites we need to be looking at, identified by their
site notation. Providing we know an easting and northing of a point, and
a rough kilometer value to search around the point we can call

``` r
sites_of_interest <- fetch_sample_points(easting="402628", northing="463188", distance = 2)
```

Now we know the identifiers for where we want to look, we want to find
out what dissolved Zn samples have been taken in the area. There are two
options for this, we can either find an individual site in our
`sites_of_interest` data frame and call

``` r
single_site <- fetch_sample_res(site_notation = "NE-49705086", dets = "3408")
```

or we can simply pass our `sites_of_interest`data frame to the function
like so

``` r
multiple_sites <- fetch_sample_res(df = sites_of_interest, dets = "3408")
```

we can also check for another determinand, lets say we are also
interested in copper which has the det code **6450**

``` r
multiple_sites_and_dets <- fetch_sample_res(df = sites_of_interest, dets = c("3408","6450"))
```

Now we have all the data for use in further analysis.

## Things on the horizon

- More `helper` functions to help understanding of arguments that can be
  passed to functions
- Open sourcing the shiny app that uses this API
- I also have a couple of ideas about the direction of this package:
  - Keep it as a low dependency package which only purpose is to
    interact with the ddspwqa API
  - Build in some standardised mapping/graphing functionality (but
    increase dependency)

## Data Sources

Uses Environment Agency water quality data from the Water Quality
Archive (Beta). The archive is provided as open data under the Open
Government Licence with no requirement for registration.
