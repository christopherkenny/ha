#' Retrieve Home Assistant Error Log
#'
#' @param ip `r template_var_ip()`
#'
#' @returns A list containing the Home Assistant error log
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_get_error_log()
ha_get_error_log <- function(ip = NULL) {
  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('error_log') |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    )

  resp <- req |>
    httr2::req_perform()

  resp |>
    httr2::resp_body_raw() |>
    rawToChar() |>
    strsplit('\n')
}
