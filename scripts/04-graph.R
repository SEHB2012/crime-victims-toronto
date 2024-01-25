#### Preamble ####
# Purpose: Makes graphs (to refer back incase quarto does not render)
# Author: Sehar Bajwa 
# Date: 23 January 2023 
# Contact: sehar.bajwa@mail.utoronto.ca

#### Workspace setup ####
#install.packages("pheatmap")
library("pheatmap")

### Data Model 1###
# Scatterplot showing changing in number of crimes per year per crime type
data_groupsbycrime |>
  ggplot(aes(x = report_year, y = sum_count, color = subtype, type ="b")) +
  geom_point() +
  geom_line()+
  theme_minimal() +
  labs(x = "Year", y = "Crime Count", color = "Crime Type",type ="b") +
  scale_color_brewer(palette = "Set1") +
  ggtitle("Trends in crimes against females in Toronto")
theme(legend.position = "right")

### Data Model 2###
# heatmap using crime count as color intensity to show which age groups are most susceptible to crime 

# Custom order vector
custom_order <- c("<12", "12 to 17", "18 to 24", "25 to 34","35 to 44","45 to 54","55 to 64","65+")

data_groupsbyage <- data_groupsbyage %>%
  arrange(factor(age_cohort, levels = custom_order))
# Pivot the data to wide format for the heatmap
heatmap_data <- data_groupsbyage %>%
  pivot_wider(names_from = report_year, values_from = sum_count, values_fill = 0)
str(heatmap_data)
heatmap_matrix <- as.matrix(heatmap_data[1:nrow(heatmap_data), -1])

#using package pretty heatmap
pheatmap(heatmap_matrix,
         display_numbers = T,
         Colv = NA,
         Rowv = NA,
         show_rownames = T,
         show_colnames = T,
         xlab = "Year",
         ylab = "Crime Type",
         main = "Which female age group is most susceptible to crimes in Toronto?",
         labels_row=c("<12","12 to 17","18 to 24","25 to 34","35 to 44","45 to 54","55 to 64","65+"),
         cluster_cols = F,
         cluster_rows = F,
)
