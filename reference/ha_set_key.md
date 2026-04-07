# Add Entry to Renviron

Adds Home Assistant API key to .Renviron.

## Usage

``` r
ha_set_key(key, overwrite = FALSE, install = FALSE, r_env = NULL)
```

## Arguments

- key:

  Character. API key to add to add.

- overwrite:

  Defaults to FALSE. Boolean. Should existing `FELT_KEY` in Renviron be
  overwritten?

- install:

  Defaults to FALSE. Boolean. Should this be added to an environment
  file, `r_env`?

- r_env:

  Path to install to if `install` is `TRUE`.

## Value

key, invisibly

## Examples

``` r
example_env <- tempfile(fileext = '.Renviron')
ha_set_key('EXAMPLE-1234', r_env = example_env)
#> Example key. Returning without setting.
# r_env should likely be: file.path(Sys.getenv('HOME'), '.Renviron')
```
