# Set Home Assistant State

Set Home Assistant State

## Usage

``` r
ha_set_states(entity_id, state, attributes = NULL, ip = NULL)
```

## Arguments

- entity_id:

  Entity ID. For example, `sensor.temperature`.

- state:

  A state value. For example, `on` or `off`.

- attributes:

  Optional. A named list of attributes to set for the entity.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

a list of information on the new or updated state

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_set_states(entity_id = 'rpkg.test', state = 'on',
  attributes = list(version = '4.5.1'))
}
```
