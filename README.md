
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ucdp

<!-- badges: start -->

[![R build
status](https://github.com/mcgirjau/ucdp/workflows/R-CMD-check/badge.svg)](https://github.com/mcgirjau/ucdp/actions)
<!-- badges: end -->

An R data package for the [Uppsala Conflict Data
Program](https://ucdp.uu.se/downloads/), containing the Georeferenced
Event Dataset (GED) Global version 20.1. This dataset is UCDP’s most
disaggregated dataset, covering individual events of organized violence
(phenomena of lethal violence occurring at a given time and place).
These events are sufficiently fine-grained to be geo-coded down to the
level of individual villages, with temporal durations disaggregated to
single, individual days.

## Installation

You can install the development version of `ucdp` from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mcgirjau/ucdp")
```

## Usage

Load the package in your R session with:

``` r
library(ucdp)
```

Use the `GED` dataset as-is, or load it explicitly into your environment
using:

``` r
data("GED")
```

## Examples

The following are some examples of questions that the Georeferenced
Event Dataset may help investigate. Load these additional packages to
try out the examples:

``` r
library(dplyr)
library(ggplot2)
library(knitr)
library(tidyr)
```

### How does the number of total conflict fatalities vary from 1989 to 2019?

Let’s make a time series plot to visualize how the number of total
deaths varies by year.

``` r
GED %>%
  group_by(year) %>% 
  summarize(total_deaths = sum(best)) %>% 
  ggplot(aes(x = year, y = total_deaths)) + 
  geom_line(color = "darkred") +
  labs(x = "Year", y = "Total Deaths", title = "Total Deaths by Year")
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" style="display: block; margin: auto;" />

Notice the very dramatic peak in total fatalities around 1994. Was that
a tumultuous year for the entire world, or was there a single event that
produced such a large volume of deaths? Let’s add region to our graph in
order to find out:

``` r
GED %>%
  group_by(year, region) %>% 
  summarize(total_deaths = sum(best)) %>% 
  ggplot(aes(x = year, y = total_deaths, color = region)) + 
  geom_line() +
  labs(x = "Year", y = "Total Deaths", color = "Region", title = "Total Deaths by Year") +
  theme(legend.position = "bottom")
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" style="display: block; margin: auto;" />

Seems like the 1994 peak in total fatalities was due to some African
conflict. By comparison, that same year was relatively non-lethal for
all other regions.

Notice how conflicts in Africa used to produce a large volume of deaths
until around 2001, after which things began to calm down. Conflicts in
Asia, Europe, and the Americas have produced very few deaths from 1989
to 2019, and conflicts in the Middle East region used to follow the same
pattern until around 2011, when a sudden surge in fatalities can be
observed. That surge peaked around 2014, and conflict fatalities in the
region have been decreasing steadily since, almost reaching pre-2011
levels in 2019.

### Which 10 countries sustained the most conflict fatalities from 1989 to 2019?

``` r
GED %>%
  group_by(country) %>% 
  summarize(total_deaths = sum(best)) %>% 
  arrange(desc(total_deaths)) %>%
  head(10) %>%
  kable(col.names = c("Country", "Total Fatalities"))
```

| Country          | Total Fatalities |
| :--------------- | ---------------: |
| Rwanda           |           543176 |
| Syria            |           359843 |
| Afghanistan      |           257944 |
| Ethiopia         |           178169 |
| Iraq             |           121659 |
| DR Congo (Zaire) |           114859 |
| Sudan            |            93128 |
| Sri Lanka        |            65628 |
| Nigeria          |            57032 |
| India            |            56716 |

### What were the deadliest conflicts in each region from 1989 to 2019?

``` r
GED %>%
  group_by(region, conflict_name) %>% 
  summarize(total_deaths = sum(best)) %>% 
  slice_max(order_by = total_deaths, n = 1) %>%
  kable(col.names = c("Region", "Conflict", "Total Fatalities"))
```

| Region      | Conflict                         | Total Fatalities |
| :---------- | :------------------------------- | ---------------: |
| Africa      | Government of Rwanda - Civilians |           534213 |
| Americas    | Colombia: Government             |            19954 |
| Asia        | Afghanistan: Government          |           229878 |
| Europe      | Russia (Soviet Union): Chechnya  |            18196 |
| Middle East | Syria: Government                |           251210 |

### What were the most intentionally-lethal actors (i.e. actors not targetting civilians) on the world stage from 1989 to 2019?

``` r
GED %>%
  select(side_a, side_b, deaths_a, deaths_b) %>%
  pivot_longer(cols = c(side_a, side_b), names_to = "side_id", values_to = "side_name") %>%
  mutate(deaths_inflicted = ifelse(side_id == "side_a", deaths_b, deaths_a)) %>%
  group_by(side_name) %>% 
  summarize(total_deaths_inflicted = sum(deaths_inflicted)) %>% 
  arrange(desc(total_deaths_inflicted)) %>%
  head(10) %>%
  kable(col.names = c("Actor", "Total Deaths Inflicted"))
```

| Actor                     | Total Deaths Inflicted |
| :------------------------ | ---------------------: |
| Government of Afghanistan |                 136781 |
| Syrian insurgents         |                 102555 |
| Government of Syria       |                  85091 |
| IS                        |                  47671 |
| Government of Iraq        |                  45135 |
| EPLF                      |                  42900 |
| EPRDF                     |                  39893 |
| Government of Sri Lanka   |                  37831 |
| Taleban                   |                  34561 |
| Government of Turkey      |                  25461 |
