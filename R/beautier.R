#' \code{beautier}: A package to create a \code{BEAST2} input file.
#'
#' \code{beautier} allows to create a \code{BEAST2} input file, using
#' an R interface. \code{beautier} closely follows the interface
#' of \code{BEAUti 2}, a GUI tool bundled with \code{BEAST2}, including
#' its default settings.
#'
#' @examples
#'   # Get an example FASTA file
#'   input_filename <- get_fasta_filename()
#'
#'   # The file created by beautier, a BEAST2 input file
#'   output_filename <- tempfile()
#'
#'   # Use the default BEAUti settings to create a BEAST2 input file
#'   create_beast2_input_file_from_model(
#'     input_filename,
#'     output_filename,
#'     inference_model = create_inference_model()
#'   )
#'   testthat::expect_true(file.exists(output_filename))
#' @seealso
#' These are packages associated with \code{beautier}:
#' \itemize{
#'   \item{
#'     The package \code{beastier} can run
#'     BEAST2 from R
#'   }
#'   \item{
#'     The package \code{tracerer} can parse
#'     BEAST2 output files from R
#'   }
#'   \item{
#'     The package \code{mauricer} manages
#'     BEAST2 packages from R
#'   }
#'   \item{
#'     The package \code{babette} combines the
#'     functionality of \code{beautier},
#'     \code{beastier}, \code{mauricer} and \code{tracerer}
#'     into a single workflow
#'   }
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name beautier
NULL
