# GDP Per Capita Animation with `gganimate`

This project visualizes the GDP per capita for selected African countries over time (1993–2023). Using `gganimate` and `ggplot2`, the animation illustrates trends in GDP per capita while accounting for population size.

## Table of Contents

1. [Overview](#overview)
2. [Dataset](#dataset)
3. [Requirements](#requirements)
4. [Usage](#usage)
5. [Output](#output)
6. [Credits](#credits)

---

## Overview

The project creates an animated scatter plot that shows:
- **X-axis**: Year
- **Y-axis**: GDP per capita (current US dollars)
- **Bubble size**: Population size (in millions)
- **Bubble color**: Country name

The animation provides a dynamic representation of economic growth across selected African nations.

---

## Dataset

The data file, `GDP per capital by population.xlsx`, contains:
- Country Name
- Year
- GDP per Capita (Current US$)
- Population (in millions)

### Countries Filtered:
- Nigeria
- South Africa
- Angola
- Egypt
- Kenya

Source: [World Bank Open Data](https://databank.worldbank.org)

---

## Requirements

Install the following R packages:
- `ggplot2`: Visualization
- `gganimate`: Animation
- `gapminder`: Data exploration (optional, not actively used)
- `readxl`: Reading Excel files
- `dplyr`: Data manipulation

Run the command below to install these packages:
```R
install.packages(c("ggplot2", "gganimate", "gapminder", "readxl", "dplyr"))
