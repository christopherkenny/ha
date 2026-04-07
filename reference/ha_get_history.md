# Retrieve Home Assistant History

Retrieve Home Assistant History

## Usage

``` r
ha_get_history(entity_id, timestamp = NULL, ip = NULL)
```

## Arguments

- entity_id:

  Required. Entity ID. For example, `sensor.temperature`.

- timestamp:

  Optional. Time in `YYYY-MM-DDThh:mm:ssTZD` format.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list containing Home Assistant history entries.

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_get_history('update.home_assistant_core_update')
}
```
