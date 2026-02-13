#' Initialize muiselib defaults
#' 
#' This function sets the global ggplot2 theme and default color palettes
#' to the muiselib standard.
#' 
#' @export
muiselib_setup <- function() {
  
  # Check if font is available to avoid warnings later, fallback to sans if not
  base_font <- "IBM Plex Sans"
  if (requireNamespace("systemfonts", quietly = TRUE) && !systemfonts::system_fonts()$family[match(base_font, systemfonts::system_fonts()$family, nomatch = 0)] == base_font) {
     warning(sprintf("Font '%s' not found. Falling back to default sans.", base_font))
     base_font <- "sans"
  }
  ggplot2::theme_set(ggplot2::theme_classic(base_family = base_font))

  # 2. Define custom palettes
  pal_list <- list(
    c("#4575b4", "#66bd63"),
    RColorBrewer::brewer.pal(3, "Set2"),
    c("#4053d3", "#ddb310", "#b51d14", "#00beff", "#fb49b0"),
    RColorBrewer::brewer.pal(6, "Accent")
  )

  options(
    ggplot2.discrete.colour = pal_list,
    ggplot2.discrete.fill = pal_list
  )
  
  message("muiselib: ggplot2 theme and palettes successfully configured.")
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "muiselib loaded. Run 'muiselib_setup()' to apply default themes and palettes."
  )
}