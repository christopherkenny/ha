#' Render a Home Assistant Template
#'
#' @param template a length one character vector containing the template to render.
#' @param ip `r template_var_ip()`
#'
#' @returns A length one character vector containing the rendered template
#' @export
#'
#' @examplesIf ha_has_key()
#' ha_render_template("My living room light is {{ states('light.h6076') }}.")
ha_render_template <- function(template, ip = NULL) {

  if (missing(template)) {
    cli::cli_abort('Missing {.arg template}, but a template string is required.')
  }

  base_url <- api_url(local = is.null(ip), ip = ip)

  req <- httr2::request(base_url = base_url) |>
    httr2::req_url_path_append('template') |>
    httr2::req_auth_bearer_token(token = ha_get_key()) |>
    httr2::req_headers(
      `Content-Type` = 'application/json'
    ) |>
    httr2::req_body_json(
      data = list(template = template),
      auto_unbox = TRUE
    )

  req |>
    httr2::req_perform() |>
    httr2::resp_body_string()
}
