#' Set Home Assistant State
#'
#' @param entity_id `r template_var_entity_id()`
#' @param state `r template_var_state()`
#' @param attributes Optional. A named list of attributes to set for the entity.
#' @param ip `r template_var_ip()`
#'
#' @returns a list of information on the new or updated state
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_set_states(entity_id = 'rpkg.test', state = 'on',
#'   attributes = list(version = '4.5.1'))
ha_set_states <- function(entity_id, state, attributes = NULL, ip = NULL) {

    if (missing(entity_id)) {
      cli::cli_abort('Missing {.arg entity_id}, but an entity ID is required.')
    }

  if (missing(state)) {
    cli::cli_abort('Missing {.arg state}, but a state is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  body <- list(
    state = state,
    attributes = attributes
  ) |>
    purrr::discard(.p = is.null)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('states', entity_id) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_body_json(
      body,
      auto_unbox = TRUE
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
