#' Set Home Assistant Intents
#'
#' Note that this requires use of "intents" for Home Assistant, which
#' are not enabled by default. Using these without enabling them will
#' create an error.
#'
#' @param intent an intent to fire
#' @param ip `r template_var_ip()`
#'
#' @returns A list of intents
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_set_intent(list(name = 'SetTimer', data = list(seconds = '30')))
ha_set_intent <- function(intent, ip = NULL) {

  if (missing(intent)) {
    cli::cli_abort('Missing {.arg intent}, but intent  is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('intent/handle') |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_body_json(
      data = intent,
      auto_unbox = TRUE
    ) |>
    httr2::req_method('POST')

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
