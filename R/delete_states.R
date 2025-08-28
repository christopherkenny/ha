#' Remove Home Assistant State
#'
#' @param entity_id `r template_var_entity_id()`
#' @param ip `r template_var_ip()`
#'
#' @returns A list containing a confirmation message.
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_set_states('rpkg.test', 'on')
#' ha_delete_states('rpkg.test')
ha_delete_states <- function(entity_id, ip = NULL) {
  if (missing(entity_id)) {
    cli::cli_abort('Missing {.arg entity_id}, but an entity ID is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('states', entity_id) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_method('DELETE')

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
