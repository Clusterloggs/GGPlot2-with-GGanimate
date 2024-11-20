
# install the required packages
install.packages(c("gganimate", "gapminder", "ggplot2"))


# Load the libraries
library(ggplot2)
library(gganimate)
library(gapminder)
library(readxl)
library(dplyr)

file_path <- 
  "VSCODE/GGPlot2-with-GGanimate/GDP per capital by population.xlsx"

GDP_df <- read_excel(file_path)


GDP_df$`GDP per capital (Current US$)` <- 
  as.numeric(GDP_df$`GDP per capital (Current US$)`)

GDP_df$`Population(Million)` <- 
  as.numeric(GDP_df$`Population(Million)`)

GDP_df$Year <- as.numeric(GDP_df$Year)


# Round the GDP per capital (Current US$) and the 
# Population(Million) column to 2 decimal places
GDP_df$`Population(Million)` <- round(GDP_df$`Population(Million)`, 2)


GDP_df$`GDP per capital (Current US$)` <- 
  round(GDP_df$`GDP per capital (Current US$)`, 2)

View(GDP_df)

# Filter out Nigeria and South Africa into a new dataset
GDP_df <- GDP_df %>%
  filter(`Country Name` %in% c(
    "Nigeria", "South Africa", "Angola", "Egypt, Arab Rep.", "Kenya"))


# Your plot with the improvements
ploty <- ggplot(
  GDP_df,
  aes(
    x = Year,
    y = `GDP per capital (Current US$)`,
    size = `Population(Million)`,
    colour = `Country Name`
  )
) +
  # Plot the points (marks for each year)
  geom_point(show.legend = TRUE, alpha = 0.7) +
  # Plot the path for each country
  geom_path(aes(group = `Country Name`), show.legend = FALSE, alpha = 0.8, size = 1.5) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  # Add axis labels
  labs(
    title = "GDP per Capita (1993 - 2023)",
    x = "Year",
    y = "GDP per Capita (Current US$)",
    caption = "databank.worldbank.org"
  ) +
  transition_reveal(as.integer(Year))
  #ease_aes("linear")
# the ease_aes() wont work because i used the transition_reveal() instead of
#transition_time(). because i choose the point travel path over the timeline

# Save with larger resolution
anime_plot <- animate(ploty, width = 800, height = 600, res = 150, renderer = gifski_renderer())

# save as gif
anim_save("C:/Users/Kintonde/Documents/VSCODE/GGPlot2-with-GGanimate/ploty.gif", animation = anime_plot)


