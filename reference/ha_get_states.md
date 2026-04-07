# Retrieve Home Assistant States

Retrieve Home Assistant States

## Usage

``` r
ha_get_states(entity_id = NULL, ip = NULL)
```

## Arguments

- entity_id:

  Optional. Entity ID. For example, `sensor.temperature`.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list containing Home Assistant state information.

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_get_states()
}
```
