#' Set Home Assistant Services
#'
#' @param domain `r template_var_domain()`
#' @param service `r template_var_service()`
#' @param entity_id `r template_var_entity_id()`
#' @param ip `r template_var_ip()`
#'
#' @returns A list of changes made by the service call
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_set_services('light', 'turn_off', 'light.h6076')
ha_set_services <- function(domain, service, entity_id, ip = NULL) {

  if (missing(domain) || missing(service)) {
    cli::cli_abort('Both {.code domain} and {.code service} must be provided.')
  }

  if (missing(entity_id)) {
    cli::cli_abort('Missing {.arg entity_id}, but an entity ID is required.')
  }

  body <- list(
    entity_id = entity_id
  ) |>
    purrr::discard(.p = is.null)

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('services', domain, service) |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_body_json(
      data = body,
      auto_unbox = TRUE
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}
