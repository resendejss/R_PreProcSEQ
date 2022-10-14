#' @title Evaluates the quality control of raw files (FASTQ)
#' @name qc_raw
#' 
#' @description It assesses the quality control of FASTQ files before they are 
#' trimmed. It is the first function to be used.
#' 
#' @param dir_fq the path to the directory that contains the FASTQs files
#' @param threads number of threads
#' @param dir_qc_raw Path of the directory where the results of the function will be saved
#' 
#' @details This function needs the FastQC and MultiQC tools, as it will use these 
#' tools to generate the quality reports.
#' 
#' @return quality report
#' 
#' @author Jean Resende
#' 
#' @example 
#' qc_raw("~/samples")
#' 
#' @export
qc_raw <- function(dir_fq = getwd(), threads = 4, dir_qc_raw = "output_qc_raw"){
  setwd("~")
  system("mkdir output_qc_raw")
  
  for (i in dir(dir_fq)[stringr::str_ends(dir(dir_fq),"fastq|gz|fq")]) {
    cmd <- paste0("fastqc"," ",dir_fq, "/",i," -t ", threads, " -o ", dir_qc_raw)
    system(cmd)
  }
  
  cmd <- paste0("multiqc ", dir_qc_raw, "/.", " -o ", dir_qc_raw)
  
  system(cmd)
}
