#' Returns a list of explained variation by batch and condition
#' combinations
#'
#' @param se summarized experiment object
#' @param assay Chosen assay column name from summarized experiment object
#' @param condition Condition covariate of interest
#' @param batch Batch covariate
#' @return List of explained variation by batch and condition
#' @export
#' @examples
#' nbatch <- 3
#' ncond <- 2
#' npercond <- 10
#' data.matrix <- rnaseq_sim(ngenes=50, nbatch=nbatch, ncond=ncond, npercond=
#'     npercond, basemean=10000, ggstep=50, bbstep=2000, ccstep=800,
#'     basedisp=100, bdispstep=-10, swvar=1000, seed=1234)
#' batch <- rep(1:nbatch, each=ncond*npercond)
#' condition <- rep(rep(1:ncond, each=npercond), nbatch)
#' batchqc_explained_variation(assay, condition, batch)
batchqc_explained_variation <- function(se, assay, condition, batch) {
  data <- se@assays@data[[assay]]
  # nlb <- nlevels(as.factor(batch))
  # nlc <- nlevels(as.factor(condition))
  # if ((nlb <= 1)&&(nlc <= 1))  {
  #   cond_mod <- matrix(rep(1, ncol(data.matrix)), ncol = 1)
  #   batch_mod <- matrix(rep(1, ncol(data.matrix)), ncol = 1)
  # } else if(nlb <= 1)  {
  #   cond_mod <- model.matrix(~as.factor(condition))
  #   batch_mod <- matrix(rep(1, ncol(data.matrix)), ncol = 1)
  # } else if(nlc <= 1)  {
  #   cond_mod <- matrix(rep(1, ncol(data.matrix)), ncol = 1)
  #   batch_mod <- model.matrix(~as.factor(batch))
  # } else {
  #   cond_mod <- model.matrix(~as.factor(condition))
  #   batch_mod <- model.matrix(~as.factor(batch))
  # }
  # mod <- cbind(cond_mod, batch_mod[, -1])
  #
  # cond_test <- batchqc_f.pvalue(data.matrix, mod, batch_mod)
  # batch_test <- batchqc_f.pvalue(data.matrix, mod, cond_mod)
  #
  # cond_ps <- cond_test$p
  # batch_ps <- batch_test$p
  #
  # r2_full <- cond_test$r2_full
  # cond_r2 <- batch_test$r2_reduced
  # batch_r2 <- cond_test$r2_reduced
  # explained_variation <- round(cbind(`Full (Condition+Batch)` = r2_full,
  #                                    Condition = cond_r2, Batch = batch_r2), 5) * 100
  # rownames(explained_variation) <- rownames(data.matrix)
  # batchqc_ev <- list(explained_variation = explained_variation,
  #                    cond_test = cond_test, batch_test = batch_test)
  #
  # return(batchqc_ev)
}
