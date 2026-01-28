# Descriptive Analysis
# Summary statistics
summary(House_price)

# Detailed descriptive statistics
describe(House_price)

# Histogram
house_price_histogram <- ggplot(House_price, aes(x = House_Price)) +
  geom_histogram(binwidth = 100000, fill = "blue", color = "black") +
  labs(x = "House Price", y = "Frequency") +
  ggtitle("Distribution of House Prices") +
  theme(plot.title = element_text(hjust=0.5)) +
  theme_minimal()
house_price_histogram

# Scatter Plot of House Prices vs. Square Footage
scatter_square_footage <- ggplot(House_price, aes(x = Square_Footage, y = House_Price)) +
  geom_point(color = "red", alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "House Prices vs. Square Footage", x = "Square Footage", y = "House Price") +
  theme_minimal()
scatter_square_footage

# Scatter Plot of House Prices vs. Year Built
scatter_year_built <- ggplot(House_price, aes(x = Year_Built, y = House_Price)) +
  geom_smooth(method = "lm", color = "orange") +
  labs(title = "House Prices vs. Year Built", x = "Year Built", y = "House Price") +
  theme_minimal()
scatter_year_built

# Grouped Boxplot of House Prices by Num_Bedrooms
boxplot_house_prices_by_bedrooms <- ggplot(House_price, aes(x = factor(Num_Bedrooms), y = House_Price, fill = factor(Num_Bedrooms))) +
  geom_boxplot() +
  labs(title = "House Prices by Number of Bedrooms", x = "Number of Bedrooms", y = "House Price") +
  theme_minimal()
boxplot_house_prices_by_bedrooms

# Bar Chart of Average House Prices by Number of Bathrooms 
bar_num_bathrooms <- House_price %>%
  group_by(Num_Bathrooms) %>%
  summarise(Avg_House_Price = mean(House_Price, na.rm = TRUE)) %>%
  ggplot(aes(x = factor(Num_Bathrooms), y = Avg_House_Price, fill = factor(Num_Bathrooms)))
bar_num_bathrooms +
  geom_bar(stat = "identity") +
  labs(title = "Average House Prices by Number of Bathrooms", x = "Number of Bathrooms", y = "Average House Price") +
  theme_minimal()

# Create the violin plot with median point
violin_house_price <- ggplot(House_price, aes(x = factor(Neighborhood_Quality), y = House_Price, fill = factor(Neighborhood_Quality))) +
  geom_violin(trim = FALSE) +
  stat_summary(fun = mean, geom = "point", color = "white", size = 3) +  # Add mean point
  labs(title = "Violin Plot of House Prices by Neighborhood Quality", x = "Neighborhood Quality", y = "House Price") +
  theme_minimal()
violin_house_price

# Box plot of Lot Size and garage size
lot_size_boxplot <- ggplot(House_price, aes(x = factor(Garage_Size), y = Lot_Size)) +
  geom_boxplot(fill = "lightblue", color = "darkblue") +
  labs(title = "Lot Size by Garage Size", x = "Garage Size", y = "Lot Size") +
  theme_minimal()
lot_size_boxplot

# Create a pie chart for Garage_Size
garage_size_piechart <- ggplot(House_price, aes(x = "", fill = factor(Garage_Size))) +  
  geom_bar(width = 1, stat = "count") +  # Count occurrences of each Garage_Size
  coord_polar(theta = "y", start = 0, direction = 1) +
  labs(title = "Distribution of Garage Sizes",fill = "Garage Capacity (Cars)") +
  theme_void()
garage_size_piechart

# Create the line graph
lot_vs_square <- ggplot(House_price, aes(x = Square_Footage, y = Lot_Size)) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Regression line
  labs(title = "Lot Size vs. Square Footage",x = "Square Footage",y = "Lot Size (acres)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))
lot_vs_square
