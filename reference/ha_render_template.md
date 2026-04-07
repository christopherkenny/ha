# Render a Home Assistant Template

Render a Home Assistant Template

## Usage

``` r
ha_render_template(template, ip = NULL)
```

## Arguments

- template:

  a length one character vector containing the template to render.

- ip:

  IP address. Default is `NULL`, which uses the local host.

## Value

A length one character vector containing the rendered template

## Examples

``` r
if (FALSE) { # ha_has_key()
ha_render_template("My living room light is {{ states('light.h6076') }}.")
}
```
