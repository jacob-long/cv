to_biblatex <- function(object, ...) {
  format_bibentry1 <- function(object) {
    object <- unclass(object)[[1L]]
    rval <- paste0("@", attr(object, "bibtype"), 
                   "{", attr(object, "key"), ",")
    nl.ind <- which(names(object) %in% RefManageR:::.BibEntryNameList)
    for (i in nl.ind) object[i] <- 
      tools::encoded_text_to_latex(format_author(object[[i]]), "UTF-8")
    rval <- c(rval, vapply(names(object), function(n) {
        paste0("  ",  n, " = {", object[[n]], "},")},
      ""), "}", ""
      )
    return(rval)
  }
  if (length(object)) {
    object$.index <- NULL
    rval <- head(unlist(lapply(object, format_bibentry1)), 
                 -1L)
  }
  else rval <- character()
  class(rval) <- "Bibtex"
  rval
}

write_bib <- function (bib, file = "references.bib", biblatex = TRUE, 
                       append = FALSE, verbose = TRUE, ...) {
  if (!inherits(bib, "BibEntry")) 
    stop("Must supply and object of class BibEntry")
  if (length(bib) == 0) {
    if (verbose) 
      message("Empty bibentry list: nothing to be done.")
    return(invisible())
  }
  if (is.null(file)) 
    fh <- stdout()
  else if (is.character(file)) {
    if (!grepl("\\.bib$", file, useBytes = TRUE)) 
      file <- paste(file, ".bib", sep = "")
    fh <- file(file, open = if (append) 
      "a+"
      else "w+")
    on.exit(if (isOpen(fh)) close(fh))
  }
  if (verbose) 
    message("Writing ", length(bib), " Bibtex entries ... ", 
            appendLF = FALSE)
  if (biblatex) {
    writeLines(to_biblatex(bib, ...), fh)
  }
  else {
    writeLines(toBibtex(bib, ...), fh)
  }
  if (verbose) {
    msg <- paste0("OK\nResults written to ", if (is.null(file)) 
      "stdout"
      else paste0("file ", sQuote(file)))
    message(msg)
  }
  invisible(bib)
}

format_author <- function(author) {
  paste(vapply(author, function(p) {
    fnms <- p$family
    only_given_or_family <- is.null(fnms) || is.null(p$given)
    fbrc <- if (length(fnms) > 1L || any(grepl("[[:space:]]",
                                               fnms, useBytes = TRUE)) ||
                only_given_or_family)
      c("{", "}")
    else ""
    gbrc <- if (only_given_or_family)
      c("{", "}")
    else ""
    paste0(format(p, include = c("family")), ", ", format(p, include = "given"))
  }, ""), collapse = " and ")
}
