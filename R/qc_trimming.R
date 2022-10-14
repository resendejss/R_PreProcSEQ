#' @title Quality control of trimmed files
#' @name qc_trimming
#'
#' @description Evaluates the quality control of FASTQ files after they are
#' trimmed. It is the third function to use.
#'
#' @param dir_fq the path to the directory that contains the FASTQs files
#' @param threads number of threads
#' @param dir_qc_trrimming Path of the directory where the results of the function will be saved
#'
#' @details This function needs the FastQC and MultiQC tools, as it will use these
#' tools to generate the quality reports.
#'
#' @return quality report
#'
#' @author Jean Resende
#'
#' @example
#' qc_trimming("~/samples_trimming")
#'
#' @export
qc_trimming <- function(dir_fq = getwd(), threads = 4, dir_qc_trimming = "output_qc_trimming"){
  setwd("~")
  system("mkdir output_qc_trimming")

  for (i in dir(dir_fq)[stringr::str_ends(dir(dir_fq),"fastq|gz|fq")]) {
    cmd <- paste0("fastqc"," ",dir_fq, "/",i," -t ", threads, " -o ", dir_qc_trimming)
    system(cmd)
  }

  cmd <- paste0("multiqc ", dir_qc_trimming, "/.", " -o ", dir_qc_trimming)

  system(cmd)
}
