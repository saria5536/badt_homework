install.packages ("jpeg")
library(jpeg)
library(png)
##################### Figure 1 #################################
figure1 <- readJPEG("Figure_1_elevation.jpg")

ratio <- nrow(figure1) / ncol(figure1)

pdf("figure_1_1961.pdf", width = 6.54, height = 6.54 * ratio) ## 6.54 is double column 
## 4.92 is 1.5 column and single column is 3.15


par(mar = c(0, 0, 0, 0))  # remove margins
plot.new()
plot.window(xlim = c(0,1), ylim = c(0,ratio), xaxs = "i", yaxs = "i")

rasterImage(figure1, 0, 0, 1, ratio)

dev.off()

################### Figure 2 ####################

figure2 <- readJPEG("Diet_Diversity_Hill_Numbers.jpg")

ratio <- nrow(figure2) / ncol(figure2)

pdf("figure_2_1961.pdf", width = 6.54, height = 6.54 * ratio)

par(mar = c(0, 0, 0, 0))  # remove margins
plot.new()
plot.window(xlim = c(0,1), ylim = c(0,ratio), xaxs = "i", yaxs = "i")

rasterImage(figure2, 0, 0, 1, ratio)

dev.off()


################### Figure 3 ####################

figure3 <- readPNG("bray_spider_season_final.png")

ratio <- nrow(figure3) / ncol(figure3)

pdf("figure_3_1961.pdf", width = 6.54, height = 6.54 * ratio)

par(mar = c(0, 0, 0, 0))  # remove margins
plot.new()
plot.window(xlim = c(0,1), ylim = c(0,ratio), xaxs = "i", yaxs = "i")

rasterImage(figure3, 0, 0, 1, ratio)

dev.off()

################### Figure 4 ####################

figure4 <- readPNG("rarified_RRA_top20species_season_final.png")

ratio <- nrow(figure4) / ncol(figure4)

pdf("figure_4_1961.pdf", width = 6.54, height = 6.54 * ratio)

par(mar = c(0, 0, 0, 0))  # remove margins
plot.new()
plot.window(xlim = c(0,1), ylim = c(0,ratio), xaxs = "i", yaxs = "i")

rasterImage(figure4, 0, 0, 1, ratio)

dev.off()

################### Figure 5 ####################

figure5 <- readPNG("PREDICTED_combined_count_and_prob_threebig_final.png")

ratio <- nrow(figure5) / ncol(figure5)

pdf("figure_5_1961.pdf", width = 6.54, height = 6.54 * ratio)

par(mar = c(0, 0, 0, 0))  # remove margins
plot.new()
plot.window(xlim = c(0,1), ylim = c(0,ratio), xaxs = "i", yaxs = "i")

rasterImage(figure5, 0, 0, 1, ratio)

dev.off()

####################################################################

library(jpeg)   # or library(png)

img <- readJPEG("Figure__elevation.jpg")

# Get dimensions
width_px <- ncol(img)
height_px <- nrow(img)

# Your export width in inches
width_in <- 6.54

# Calculate DPI
dpi <- width_px / width_in
dpi
