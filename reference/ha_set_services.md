# Set Home Assistant Services

Set Home Assistant Services

## Usage

``` r
ha_set_services(domain, service, entity_id, ip = NULL)
```

## Arguments

- domain:

  An entity domain. For example, `light` or `switch`.

- service:

  A service name. For example, `turn_on` or `turn_off`.

- entity_id:

  Entity ID. For example, `sensor.temperature`.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list of changes made by the service call

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_set_services('light', 'turn_off', 'light.h6076')
}
```
