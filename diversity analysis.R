##############################
# Microbiome Diversity Analysis
##############################

## Load packages
library(openxlsx)
library(vegan)
library(ggplot2)

## Load data
metadata  <- read.xlsx("metadata.xlsx", rowNames = TRUE)
abundance <- read.xlsx("abundance.xlsx", rowNames = TRUE)

## Prevalence filter (≥20%)
presence_rate <- rowSums(abundance > 0) / ncol(abundance)
abundance <- abundance[presence_rate >= 0.2, ]

## Relative abundance
data <- t(abundance)
rel_abundance <- data / rowSums(data)

## ===== Alpha diversity =====
shannon <- diversity(rel_abundance, "shannon")
simpson <- diversity(rel_abundance, "simpson")

est <- estimateR(data)
chao1 <- est[2, ]
ace   <- est[4, ]

alpha_df <- data.frame(
  Group   = metadata$Group,
  Shannon = shannon,
  Simpson = simpson,
  ACE     = ace,
  Chao1   = chao1
)

write.xlsx(alpha_df, "alpha_diversity.xlsx", rowNames = TRUE)

## ===== Beta diversity =====
dist_mat <- vegdist(rel_abundance, method = "bray")

pcoa <- cmdscale(dist_mat, eig = TRUE)
coords <- as.data.frame(pcoa$points)

beta_df <- data.frame(
  Group = metadata$Group,
  PCoA1 = coords[,1],
  PCoA2 = coords[,2]
)

write.xlsx(beta_df, "beta_pcoa.xlsx", rowNames = FALSE)

## PERMANOVA
adonis_res <- adonis2(dist_mat ~ Group, data = beta_df, permutations = 9999)

## ===== Simple PCoA plot =====
p <- ggplot(beta_df, aes(PCoA1, PCoA2, color = Group)) +
  geom_point(size = 2) +
  theme_classic()

ggsave("pcoa_plot.pdf", p, width = 5, height = 5)
