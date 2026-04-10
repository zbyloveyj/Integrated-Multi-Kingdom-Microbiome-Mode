##############################
# Microbiome–Clinical Correlation
##############################

library(openxlsx)
library(psych)
library(ComplexHeatmap)
library(circlize)

## Load data
data <- read.xlsx("data.xlsx", rowNames = TRUE)

## Covariates
covariates <- c("age", "sex", "edu", "BMI")

## Variable selection
num_cols <- colnames(data)[sapply(data, is.numeric)]
microbiome_cols <- setdiff(num_cols, covariates)

clinical_cols <- grep("score|HAMD|MCCB|cog|scale",
                      colnames(data),
                      value = TRUE,
                      ignore.case = TRUE)

## Residuals (GLM)
residual_matrix <- data[, microbiome_cols]

for (f in microbiome_cols) {
  fit <- glm(as.formula(paste(f, "~", paste(covariates, collapse = "+"))),
             data = data)
  residual_matrix[, f] <- residuals(fit)
}

## Correlation
res <- corr.test(residual_matrix,
                 data[, clinical_cols],
                 method = "spearman",
                 adjust = "BH")

r <- res$r
p <- res$p.adj

## Save
dir.create("results", showWarnings = FALSE)
write.xlsx(r, "results/r.xlsx")
write.xlsx(p, "results/p.xlsx")

## Heatmap (minimal)
p[p >= 0.05] <- ""
p[p < 0.05]  <- "*"

pdf("results/heatmap.pdf", 10, 8)
Heatmap(t(r),
        col = colorRamp2(c(-0.5, 0, 0.5), c("darkgreen","white","orange")),
        cell_fun = function(j, i, x, y, w, h, fill)
          grid.text(p[i, j], x, y))
dev.off()
