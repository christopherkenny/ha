# Set Home Assistant Intents

Note that this requires use of "intents" for Home Assistant, which are
not enabled by default. Using these without enabling them will create an
error.

## Usage

``` r
ha_set_intent(intent, ip = NULL)
```

## Arguments

- intent:

  an intent to fire

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list of intents

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_set_intent(list(name = 'SetTimer', data = list(seconds = '30')))
}
```
