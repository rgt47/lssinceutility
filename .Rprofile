# Configure R session options for reproducibility
options(
  stringsAsFactors = FALSE,
  contrasts = c("contr.treatment", "contr.poly"),
  na.action = "na.omit",
  digits = 7,
  OutDec = "."
)

# Set locale and timezone for reproducibility
Sys.setenv(LANG = "en_US.UTF-8")
Sys.setenv(LC_ALL = "en_US.UTF-8")
Sys.setlocale("LC_TIME", "en_US.UTF-8")
Sys.setenv(TZ = "UTC")

# Suppress scientific notation for readability
options(scipen = 999)

# Initialize renv
source("renv/activate.R")

# Auto-snapshot on R exit
.Last <- function() {
  if (!is.null(getOption("ZZCOLLAB_AUTO_SNAPSHOT"))) {
    if (getOption("ZZCOLLAB_AUTO_SNAPSHOT")) {
      tryCatch({
        renv::snapshot(prompt = FALSE, type = "implicit")
      }, error = function(e) {
        message("Warning: Could not auto-snapshot renv")
      })
    }
  } else {
    # Default: auto-snapshot enabled
    tryCatch({
      renv::snapshot(prompt = FALSE, type = "implicit")
    }, error = function(e) {
      message("Warning: Could not auto-snapshot renv")
    })
  }
}
