# Remove Home Assistant State

Remove Home Assistant State

## Usage

``` r
ha_delete_states(entity_id, ip = NULL)
```

## Arguments

- entity_id:

  Entity ID. For example, `sensor.temperature`.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A list containing a confirmation message.

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_set_states('rpkg.test', 'on')
ha_delete_states('rpkg.test')
}
```
