#' @title Quantification of transcripts
#' @name salmon_quant
#'
#' @description Quantification of transcripts based on the reference transcriptome.
#' This is the function that generates the quantification for each sample.
#'
#' @param dir_fq Path to the directory with the FASTQs files
#' @param index Path to directory with transcriptome index
#'
#' @details This function makes use of the Salmon tool.
#'
#' @return transcript quantification
#'
#' @author Jean Resende
#'
#' @example
#' salmon_quant("~/samples_trimming, dir_index")
#'
#' @export
salmon_quant <- function(dir_fq, index){
  setwd("~")
  system("mkdir quantification_salmon/quant")
  cmd <- paste0("while read SAMP \n do"," salmon quant -i ", index, " -l A -1 ",
                dir_fq, "/${SAMP}_R1_trimmomatic_paired.fastq", " -2 ",dir_fq,
                "/${SAMP}_R2_trimmomatic_paired.fastq", " -p 4 --gcBias --validateMappings -o ~/quantification_salmon/quant/${SAMP}_quant \n ",
                "done < ~/samplesNames.txt")
  system(cmd)
}
