# Retrieve Home Assistant Logbook Entries

Retrieve Home Assistant Logbook Entries

## Usage

``` r
ha_get_logbook(timestamp = NULL, ip = NULL)
```

## Arguments

- timestamp:

  Optional. Time in `YYYY-MM-DDThh:mm:ssTZD` format.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list containing Home Assistant logbook entries.

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_get_logbook()
}
```
