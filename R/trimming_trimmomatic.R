#' @title FASTQ Trimming
#' @name qc_trimming
#'
#' @description Trimming and filtering of readings. Second function used in the
#' process of obtaining transcript quantification.
#'
#' @param input directory path containing the FASTQs files to be trimmed.
#'
#' @details This function makes use of the Trimmomatic tool.
#'
#' @return trimmed FASTQ files
#'
#' @author Jean Resende
#'
#' @example
#' trimming_trimmomatic("~/samples")
#'
#' @export
trimming_trimmomatic <- function(input){
  setwd("~")
  system("mkdir output_trimming")
  system("mkdir output_trimming/output_paired")
  system("mkdir output_trimming/output_unpaired")

  files <- list.files(paste0(input))
  samples_names <- unique(gsub("_...fastq","",files))
  write.table(samples_names,"samplesNames.txt",
              quote = F, row.names = F, col.names = F)

  cmd <- paste0("while read SAMP \n do"," TrimmomaticPE ", input,"/${SAMP}_R1.fastq ", input,"/${SAMP}_R2.fastq ",
                "~/output_trimming/output_paired","/${SAMP}_R1_trimmomatic_paired.fastq ",
                "~/output_trimming/output_unpaired","/${SAMP}_R1_trimmomatic_unpaired.fastq ",
                "~/output_trimming/output_paired","/${SAMP}_R2_trimmomatic_paired.fastq ",
                "~/output_trimming/output_unpaired","/${SAMP}_R2_trimmomatic_unpaired.fastq ",
                "ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 ",
                "LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 \n ",
                "done < samplesNames.txt")

  system(cmd)
}
