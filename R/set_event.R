#' Set Home Assistant Services
#'
#' @param event_type The type of event to set, e.g. `light.turn_on`
#' @param event_data Optional. A named list of data to send with the event.
#' @param ip `r template_var_ip()`
#'
#' @returns A vector of events fired with a confirmation or detailed information
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_set_event('light.test')
ha_set_event <- function(event_type, event_data = NULL, ip = NULL) {

  if (missing(event_type)) {
    cli::cli_abort('Missing {.arg event_type}, but event data is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('events', event_type) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_body_json(
      data = event_data,
      auto_unbox = TRUE
    ) |>
    httr2::req_method('POST')

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    unlist()
}
