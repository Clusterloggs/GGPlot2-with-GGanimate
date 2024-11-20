# Install required packages (only needed once)
install.packages(c("gganimate", "gapminder", "ggplot2"))

# Load necessary libraries
library(ggplot2)    # For creating plots
library(gganimate)  # For animation in ggplot2
library(gapminder)  # For working with gapminder-like data
library(readxl)     # For reading Excel files
library(dplyr)      # For data manipulation

# Specify the file path to the Excel dataset
file_path <- "VSCODE/GGPlot2-with-GGanimate/GDP per capital by population.xlsx"

# Read the Excel file into a data frame
GDP_df <- read_excel(file_path)

# Convert relevant columns to numeric data type
GDP_df$`GDP per capital (Current US$)` <- as.numeric(GDP_df$`GDP per capital (Current US$)`)
GDP_df$`Population(Million)` <- as.numeric(GDP_df$`Population(Million)`)
GDP_df$Year <- as.numeric(GDP_df$Year)

# Round numerical columns to 2 decimal places for better readability
GDP_df$`Population(Million)` <- round(GDP_df$`Population(Million)`, 2)
GDP_df$`GDP per capital (Current US$)` <- round(GDP_df$`GDP per capital (Current US$)`, 2)

# Display the dataset to ensure everything is loaded correctly
View(GDP_df)

# Filter the data for specific countries of interest
GDP_df <- GDP_df %>%
  filter(`Country Name` %in% c("Nigeria", "South Africa", "Angola", "Egypt, Arab Rep.", "Kenya"))

# Create a dynamic scatter plot with ggplot2 and gganimate
ploty <- ggplot(
  GDP_df,
  aes(
    x = Year, 
    y = `GDP per capital (Current US$)`, 
    size = `Population(Million)`, 
    colour = `Country Name`
  )
) +
  # Add points for each year's data
  geom_point(show.legend = TRUE, alpha = 0.7) +
  # Connect points within each country to form a path
  geom_path(aes(group = `Country Name`), show.legend = FALSE, alpha = 0.8, size = 1.5) +
  # Use a viridis color palette for better color differentiation
  scale_color_viridis_d() +
  # Scale the size of points
  scale_size(range = c(2, 12)) +
  # Add labels and title
  labs(
    title = "GDP per Capita (1993 - 2023)",
    x = "Year",
    y = "GDP per Capita (Current US$)",
    caption = "Source: databank.worldbank.org"
  ) +
  # Create an animated reveal effect by year
  transition_reveal(as.integer(Year))

# Render and save the animation
anime_plot <- animate(
  ploty, 
  width = 800, 
  height = 600, 
  res = 150, 
  renderer = gifski_renderer()
)

# Save the animated plot as a GIF file
anim_save("C:/Users/Kintonde/Documents/VSCODE/GGPlot2-with-GGanimate/ploty.gif", 
          animation = anime_plot)