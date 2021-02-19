
library(ggfortify)
library(ggplot2)

plot_pca <- function(se) {

  ## Need to keep in mind that will need to update with correctionMethod input
  ## which itself with update with more options after they perform a batch correction
  # Right now am ignoring that

  # Extract counts table
  counts <- assays(se)$counts
  # Sample Metadata
  md <- colData(se)
  # Get PCA data
  pc <- prcomp(na.omit(counts))
  # Plot PCA
  plotted <- autoplot(pc)
  return(plotted)
}
