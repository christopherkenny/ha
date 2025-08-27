#' Retrieve Home Assistant Logbook Entries
#'
#' @param timestamp Optional. `r template_var_timestamp()`
#' @param ip `r template_var_ip()`
#'
#' @returns A list containing the Home Assistant configuration.
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_get_logbook()
ha_get_logbook <- function(timestamp = NULL, ip = NULL) {
  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('logbook', timestamp) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
