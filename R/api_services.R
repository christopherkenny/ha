#' Retrieve Home Assistant Services
#'
#' @param ip `r template_var_ip()`
#'
#' @returns A list containing the Home Assistant configuration.
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_api_services()
ha_api_services <- function(ip = NULL) {
  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('services') |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
