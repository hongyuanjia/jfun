#' Set/Unset proxy settings
#'
#' @param proxy \\[character(1)\\] The proxy link.
#' @rdname proxy
#' @export
#' @importFrom httr set_config use_proxy
set_proxy <- function(proxy = "127.0.0.1:7890") {
    Sys.setenv(https_proxy = paste0("http://", proxy))
    Sys.setenv(http_proxy = paste0("http://", proxy))
    httr::set_config(httr::use_proxy(paste0("socks5://", proxy)))
}

#' @rdname proxy
#' @export
#' @importFrom httr reset_config
unset_proxy <- function() {
    Sys.setenv(https_proxy = "")
    Sys.setenv(http_proxy = "")
    httr::reset_config()
}
