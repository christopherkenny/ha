# `ha`

The goal of `ha` is to control your smart home using HomeAssistant from
your R session.

## Installation

You can install the development version of `ha` from
[GitHub](https://github.com/christopherkenny/ha) with:

``` r
# install.packages('pak')
pak::pak('christopherkenny/ha')
```

## Controlling your smart home

``` r
library(ha)
```

First, you need to allow your HomeAssistant to use the API. You can do
this by editing your `config/configuration.yaml` file to include:

``` R
api:
```

Then, restart HomeAssistant. Get a key from the HomeAssistant UI under
your profile.

If you have an ios or Android device, you can create a long-lived access
token from your profile page on the mobile app. This is done by
scrolling down to the bottom of the app, selecting your profile, and
creating a new long-lived access token.

Then, setup your key.

``` r
ha_set_key('YOUR_LONG_LIVED_ACCESS_TOKEN', install = TRUE)
```

To check that this is configured correctly, use the simple
[`ha_api()`](http://christophertkenny.com/ha/reference/ha_api.md)
function:

``` r
ha_api()
#> $message
#> [1] "API running."
```

From there, you can perform any of the available API calls, such as
states, events, or services. For example, to get states:

``` r
ha_get_states()[[1]]
#> $entity_id
#> [1] "update.home_assistant_supervisor_update"
#> 
#> $state
#> [1] "off"
#> 
#> $attributes
#> $attributes$auto_update
#> [1] TRUE
#> 
#> $attributes$display_precision
#> [1] 0
#> 
#> $attributes$installed_version
#> [1] "2026.03.2"
#> 
#> $attributes$in_progress
#> [1] FALSE
#> 
#> $attributes$latest_version
#> [1] "2026.03.2"
#> 
#> $attributes$release_summary
#> NULL
#> 
#> $attributes$release_url
#> [1] "https://github.com/home-assistant/supervisor/releases/tag/2026.03.2"
#> 
#> $attributes$skipped_version
#> NULL
#> 
#> $attributes$title
#> [1] "Home Assistant Supervisor"
#> 
#> $attributes$update_percentage
#> NULL
#> 
#> $attributes$entity_picture
#> [1] "/api/brands/integration/hassio/icon.png?placeholder=no"
#> 
#> $attributes$friendly_name
#> [1] "Home Assistant Supervisor Update"
#> 
#> $attributes$supported_features
#> [1] 1
#> 
#> 
#> $last_changed
#> [1] "2026-04-07T00:20:39.316717+00:00"
#> 
#> $last_reported
#> [1] "2026-04-07T00:20:39.316717+00:00"
#> 
#> $last_updated
#> [1] "2026-04-07T00:20:39.316717+00:00"
#> 
#> $context
#> $context$id
#> [1] "01KNJN048MG1D8500PS0S8HT6B"
#> 
#> $context$parent_id
#> NULL
#> 
#> $context$user_id
#> NULL
```

Once you have devices connected, you can interact with them. For
example, to toggle a light:

``` r
ha_set_services('light', 'turn_on', entity_id = 'light.h6076')
#> [[1]]
#> [[1]]$entity_id
#> [1] "light.h6076"
#> 
#> [[1]]$state
#> [1] "on"
#> 
#> [[1]]$attributes
#> [[1]]$attributes$min_color_temp_kelvin
#> [1] 2000
#> 
#> [[1]]$attributes$max_color_temp_kelvin
#> [1] 9000
#> 
#> [[1]]$attributes$effect_list
#> [[1]]$attributes$effect_list[[1]]
#> [1] "none"
#> 
#> [[1]]$attributes$effect_list[[2]]
#> [1] "sunrise"
#> 
#> [[1]]$attributes$effect_list[[3]]
#> [1] "sunset"
#> 
#> [[1]]$attributes$effect_list[[4]]
#> [1] "movie"
#> 
#> [[1]]$attributes$effect_list[[5]]
#> [1] "dating"
#> 
#> [[1]]$attributes$effect_list[[6]]
#> [1] "romantic"
#> 
#> [[1]]$attributes$effect_list[[7]]
#> [1] "twinkle"
#> 
#> [[1]]$attributes$effect_list[[8]]
#> [1] "candlelight"
#> 
#> [[1]]$attributes$effect_list[[9]]
#> [1] "snowflake"
#> 
#> [[1]]$attributes$effect_list[[10]]
#> [1] "energetic"
#> 
#> [[1]]$attributes$effect_list[[11]]
#> [1] "breathe"
#> 
#> [[1]]$attributes$effect_list[[12]]
#> [1] "crossing"
#> 
#> 
#> [[1]]$attributes$supported_color_modes
#> [[1]]$attributes$supported_color_modes[[1]]
#> [1] "color_temp"
#> 
#> [[1]]$attributes$supported_color_modes[[2]]
#> [1] "rgb"
#> 
#> 
#> [[1]]$attributes$effect
#> NULL
#> 
#> [[1]]$attributes$color_mode
#> [1] "rgb"
#> 
#> [[1]]$attributes$brightness
#> [1] 255
#> 
#> [[1]]$attributes$color_temp_kelvin
#> NULL
#> 
#> [[1]]$attributes$hs_color
#> [[1]]$attributes$hs_color[[1]]
#> [1] 0
#> 
#> [[1]]$attributes$hs_color[[2]]
#> [1] 0
#> 
#> 
#> [[1]]$attributes$rgb_color
#> [[1]]$attributes$rgb_color[[1]]
#> [1] 255
#> 
#> [[1]]$attributes$rgb_color[[2]]
#> [1] 255
#> 
#> [[1]]$attributes$rgb_color[[3]]
#> [1] 255
#> 
#> 
#> [[1]]$attributes$xy_color
#> [[1]]$attributes$xy_color[[1]]
#> [1] 0.323
#> 
#> [[1]]$attributes$xy_color[[2]]
#> [1] 0.329
#> 
#> 
#> [[1]]$attributes$friendly_name
#> [1] "H6076"
#> 
#> [[1]]$attributes$supported_features
#> [1] 4
#> 
#> 
#> [[1]]$last_changed
#> [1] "2026-04-07T00:57:14.121917+00:00"
#> 
#> [[1]]$last_reported
#> [1] "2026-04-07T00:57:14.121917+00:00"
#> 
#> [[1]]$last_updated
#> [1] "2026-04-07T00:57:14.121917+00:00"
#> 
#> [[1]]$context
#> [[1]]$context$id
#> [1] "01KNJQ33M54JB4RWTVAKM5G71C"
#> 
#> [[1]]$context$parent_id
#> NULL
#> 
#> [[1]]$context$user_id
#> [1] "3acbda1387d24cbaab1c2d638f189f45"
```

(Beware, when I run this on my own network, it turns on a light on, so
let’s turn it off again!)

``` r
ha_set_services('light', 'turn_off', entity_id = 'light.h6076')
#> [[1]]
#> [[1]]$entity_id
#> [1] "light.h6076"
#> 
#> [[1]]$state
#> [1] "off"
#> 
#> [[1]]$attributes
#> [[1]]$attributes$min_color_temp_kelvin
#> [1] 2000
#> 
#> [[1]]$attributes$max_color_temp_kelvin
#> [1] 9000
#> 
#> [[1]]$attributes$effect_list
#> [[1]]$attributes$effect_list[[1]]
#> [1] "none"
#> 
#> [[1]]$attributes$effect_list[[2]]
#> [1] "sunrise"
#> 
#> [[1]]$attributes$effect_list[[3]]
#> [1] "sunset"
#> 
#> [[1]]$attributes$effect_list[[4]]
#> [1] "movie"
#> 
#> [[1]]$attributes$effect_list[[5]]
#> [1] "dating"
#> 
#> [[1]]$attributes$effect_list[[6]]
#> [1] "romantic"
#> 
#> [[1]]$attributes$effect_list[[7]]
#> [1] "twinkle"
#> 
#> [[1]]$attributes$effect_list[[8]]
#> [1] "candlelight"
#> 
#> [[1]]$attributes$effect_list[[9]]
#> [1] "snowflake"
#> 
#> [[1]]$attributes$effect_list[[10]]
#> [1] "energetic"
#> 
#> [[1]]$attributes$effect_list[[11]]
#> [1] "breathe"
#> 
#> [[1]]$attributes$effect_list[[12]]
#> [1] "crossing"
#> 
#> 
#> [[1]]$attributes$supported_color_modes
#> [[1]]$attributes$supported_color_modes[[1]]
#> [1] "color_temp"
#> 
#> [[1]]$attributes$supported_color_modes[[2]]
#> [1] "rgb"
#> 
#> 
#> [[1]]$attributes$effect
#> NULL
#> 
#> [[1]]$attributes$color_mode
#> NULL
#> 
#> [[1]]$attributes$brightness
#> NULL
#> 
#> [[1]]$attributes$color_temp_kelvin
#> NULL
#> 
#> [[1]]$attributes$hs_color
#> NULL
#> 
#> [[1]]$attributes$rgb_color
#> NULL
#> 
#> [[1]]$attributes$xy_color
#> NULL
#> 
#> [[1]]$attributes$friendly_name
#> [1] "H6076"
#> 
#> [[1]]$attributes$supported_features
#> [1] 4
#> 
#> 
#> [[1]]$last_changed
#> [1] "2026-04-07T00:57:14.154206+00:00"
#> 
#> [[1]]$last_reported
#> [1] "2026-04-07T00:57:14.154206+00:00"
#> 
#> [[1]]$last_updated
#> [1] "2026-04-07T00:57:14.154206+00:00"
#> 
#> [[1]]$context
#> [[1]]$context$id
#> [1] "01KNJQ33N70VYQ7WV089DHK7T4"
#> 
#> [[1]]$context$parent_id
#> NULL
#> 
#> [[1]]$context$user_id
#> [1] "3acbda1387d24cbaab1c2d638f189f45"
```

# Mapping of functions to API endpoints

The full list of API endpoints and their descriptions are [available
here](https://developers.home-assistant.io/docs/api/rest/).

- `ha_api():`get /api/\`
- [`ha_get_config()`](http://christophertkenny.com/ha/reference/ha_get_config.md):
  `get /api/config`
- [`ha_get_events()`](http://christophertkenny.com/ha/reference/ha_get_events.md):
  `get /api/events`
- [`ha_get_services()`](http://christophertkenny.com/ha/reference/ha_get_services.md):
  `get /api/services`
- [`ha_get_history()`](http://christophertkenny.com/ha/reference/ha_get_history.md):
  `get /api/history/period/<timestamp>`
- [`ha_get_logbook()`](http://christophertkenny.com/ha/reference/ha_get_logbook.md):
  `get /api/logbook/<timestamp>`
- [`ha_get_states()`](http://christophertkenny.com/ha/reference/ha_get_states.md):
  `get /api/states`
- `ha_get_states(entity_id=)`: `get /api/states/<entity_id>`
- [`ha_get_error_log()`](http://christophertkenny.com/ha/reference/ha_get_error_log.md):
  `get /api/error_log`
- TBD: `get /api/camera_proxy/<camera entity_id>`
- [`ha_get_calendars()`](http://christophertkenny.com/ha/reference/ha_get_calendars.md):
  `get /api/calendars`
- TBD:
  `get /api/calendars/<calendar entity_id>?start=<timestamp>&end=<timestamp>`
- [`ha_set_states()`](http://christophertkenny.com/ha/reference/ha_set_states.md):
  `post /api/states/<entity_id>`
- [`ha_set_event()`](http://christophertkenny.com/ha/reference/ha_set_event.md):
  `post /api/events/<event_type>`
- [`ha_set_services()`](http://christophertkenny.com/ha/reference/ha_set_services.md):
  `post /api/services/<domain>/<service>`
- [`ha_render_template()`](http://christophertkenny.com/ha/reference/ha_render_template.md):
  `post /api/template`
- [`ha_check_config()`](http://christophertkenny.com/ha/reference/ha_check_config.md):
  `post /api/config/core/check_config`
- [`ha_set_intent()`](http://christophertkenny.com/ha/reference/ha_set_intent.md):
  `post /api/intent/handle`
- [`ha_delete_states()`](http://christophertkenny.com/ha/reference/ha_delete_states.md):
  `delete /api/states/<entity_id>`
