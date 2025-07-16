api_url <- function(local = TRUE, ip = NULL) {
  if (local) {
    'http://homeassistant.local:8123/api'
  } else {
    if (is.null(ip)) {
      cli::cli_abort(c('No IP address provided.',
                       i = 'Set {.code ip} to the Home Assistant instance IP address.'))
    }
    paste0('http://', ip, ':8123/api')
  }
}
