#' @title Index construction
#' @name salmon_index
#'
#' @description Construction of the reference transcriptome index.
#' This index will be used by the quant_salmon function.
#'
#' @param transc Reference transcriptome path
#'
#' @details This function makes use of the Salmon tool.
#'
#' @return index
#'
#' @author Jean Resende
#'
#' @example
#' salmon_index("~/dir_gencode")
#'
#' @export
salmon_index <- function(transc){
  setwd("~")
  system("mkdir quantification_salmon")
  system("mkdir quantification_salmon/index")
  cmd <- paste0("salmon index -t ", transc, " -i ~/quantification_salmon/index")
  system(cmd)
}

