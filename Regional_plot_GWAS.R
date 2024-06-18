# Install and load necessary packages
install.packages("qqman")
library(qqman)

# Read the CSV file
your_data <- read.csv("GAPIT.Association.GWAS_Results.MLM.CaffeicAcid.csv")

# Set the chromosome, start position, and end position for the specified region
chr <- 1
start_pos <- 50000
end_pos <- 100000

# Subset the data for the specified region
region_data <- your_data[your_data$Chr == chr & your_data$Pos >= start_pos & your_data$Pos <= end_pos, ]

# Create a regional association plot
manhattan(region_data, chr = "Chr", bp = "Pos", p = "P.value", 
          col = c("blue", "orange"), 
          main = "Regional Association Plot", 
          ylim = c(0, 10), # You can adjust the y-axis limits as needed
          xlim = c(start_pos, end_pos),  # Set x-axis limits
          cex = 0.6, # Adjust point size
          suggestiveline = FALSE, # You can set to TRUE if you want to add a suggestive line
          genomewideline = -log10(5e-8)) # You can set to -log10(5e-8) for a genome-wide significance line

# Save the plot
dev.copy(png, "regional_association_plot.png")
dev.off()
