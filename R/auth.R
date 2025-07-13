#' Check or Get Home Assistant API Key
#'
#' @return logical if `has`, key if `get`
#' @export
#'
#' @name key
#'
#' @concept key
#'
#' @examples
#' ha_has_key()
ha_has_key <- function() {
  Sys.getenv('HOMEASSISTANT_KEY') != ''
}

#' @rdname key
#' @export
ha_get_key <- function() {
  key <- Sys.getenv('HOMEASSISTANT_KEY')
  invisible(key)
}


#' Add Entry to Renviron
#'
#' Adds Home Assistant API key to .Renviron.
#'
#' @param key Character. API key to add to add.
#' @param overwrite Defaults to FALSE. Boolean. Should existing `FELT_KEY` in Renviron be overwritten?
#' @param install Defaults to FALSE. Boolean. Should this be added to an environment file, `r_env`?
#' @param r_env Path to install to if `install` is `TRUE`.
#'
#' @return key, invisibly
#' @export
#'
#' @concept key
#'
#' @examples
#' example_env <- tempfile(fileext = '.Renviron')
#' ha_set_key('EXAMPLE-1234', r_env = example_env)
#' # r_env should likely be: file.path(Sys.getenv('HOME'), '.Renviron')
ha_set_key <- function(key, overwrite = FALSE, install = FALSE,
                         r_env = NULL) {
  if (missing(key)) {
    cli::cli_abort('Input {.arg key} cannot be missing.')
  }
  name <- 'HOMEASSISTANT_KEY'

  key <- list(key)
  names(key) <- name

  if (install) {

    if (is.null(r_env)) {
      r_env <- file.path(Sys.getenv('HOME'), '.Renviron')
      if (interactive()) {
        utils::askYesNo(paste0('Install to',  r_env, '?'))
      } else {
        cli::cli_abort(c('No path set and not run interactively.',
                         i = 'Rerun with {.arg r_env} set, possibly to {.file {r_env}}'))
      }
    }

    if (!file.exists(r_env)) {
      file.create(r_env)
    }

    lines <- readLines(r_env)
    newline <- paste0(name, "='", key, "'")

    exists <- stringr::str_detect(lines, paste0(name, '='))

    if (any(exists)) {
      if (sum(exists) > 1) {
        cli::cli_abort('Multiple entries in .Renviron found.\nEdit manually with {.fn usethis::edit_r_environ}.')
      }

      if (overwrite) {
        lines[exists] <- newline
        writeLines(lines, r_env)
        do.call(Sys.setenv, key)
      } else {
        cli::cli_inform('{.val HOMEASSISTANT_KEY} already exists in .Renviron. \nEdit manually with {.fn usethis::edit_r_environ} or set {.code overwrite = TRUE}.')
      }
    } else {
      lines[length(lines) + 1] <- newline
      writeLines(lines, r_env)
      do.call(Sys.setenv, key)
    }
  } else {

    if (key == 'EXAMPLE-1234') {
      cli::cli_message('You provided the example key. No key was set.')
      return(invisible(key))
    }

    do.call(Sys.setenv, key)
  }

  invisible(key)
}
