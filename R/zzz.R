#' Initialize muiselib defaults
#' 
#' This function sets the global ggplot2 theme and default color palettes
#' to the muiselib standard.
#' 
#' @export
muiselib_setup <- function() {

  ggplot2::theme_set(ggplot2::theme_bw() +
    ggplot2::theme(panel.grid = ggplot2::element_blank()))

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