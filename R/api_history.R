#' Retrieve Home Assistant History
#'
#' @param entity_id Required. `r template_var_entity_id()`
#' @param timestamp Optional. `r template_var_timestamp()`
#' @param ip `r template_var_ip()`
#'
#' @returns A list containing the Home Assistant configuration.
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_api_history('update.home_assistant_core_update')
ha_api_history <- function(entity_id, timestamp = NULL, ip = NULL) {

  if (missing(entity_id)) {
    cli::cli_abort('Missing {.arg entity_id}, but an entity ID is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('history', 'period', timestamp) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_url_query(
      filter_entity_id = entity_id
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
