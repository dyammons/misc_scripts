
### Stacked bar graph - raw counts
# Input:
# > str(deg_cnts)
# tibble [8 × 3] (S3: tbl_df/tbl/data.frame)
#  $ contrast : Factor w/ 4 levels "14_vs_0","28_vs_0",..: 4 4 1 1 2 2 3 3
#  $ direction: Factor w/ 2 levels "Up","Down": 2 1 2 1 2 1 2 1
#  $ COUNTS   : int [1:8] 30 6 13 5 6 5 8 3

p <- ggplot(deg_cnts, aes(x = contrast, y = COUNTS, fill = direction, colour = direction)) +
  geom_bar(stat = "identity", linewidth = 1, alpha = 0.5) +
  theme_classic() +
  theme(
    axis.line.x = element_blank(),
    axis.ticks.x = element_blank()
  ) +
  scale_y_continuous(expand = c(0, 0)) +
  coord_cartesian(clip = "off")
