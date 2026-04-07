# Set Home Assistant Events

Set Home Assistant Events

## Usage

``` r
ha_set_event(event_type, event_data = NULL, ip = NULL)
```

## Arguments

- event_type:

  The type of event to set, e.g. `light.turn_on`

- event_data:

  Optional. A named list of data to send with the event.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A vector of events fired with a confirmation or detailed information

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_set_event('light.test')
}
```
