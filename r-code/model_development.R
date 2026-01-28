# Model Development
generalModel <- lm (House_Price ~ . , data = House_price)

firstModel <- lm(House_Price ~ 1, data = House_price)

step( firstModel , direction ="forward" , scope = formula (generalModel))
fmodel <- lm(formula = House_Price ~ Square_Footage + Year_Built + Lot_Size +
        Num_Bedrooms + Num_Bathrooms + Garage_Size, data = House_price)
summary(fmodel)

step( generalModel , direction ="backward")
bamodel <- lm(formula = House_Price ~ Square_Footage + Num_Bedrooms + Num_Bathrooms + 
        Year_Built + Lot_Size + Garage_Size, data = House_price)
summary(bamodel)

step( firstModel , direction ="both" , scope = formula (generalModel))
bomodel <- lm(formula = House_Price ~ Square_Footage + Year_Built + Lot_Size + 
        Num_Bedrooms + Num_Bathrooms + Garage_Size, data = House_price)
summary(bomodel)

#all the 3 methods return the same model so i have picked the first for testing
vif(fmodel)# VIF > 5 indicates problematic collinearity

plot(fmodel, which = 1)  #no funnel shape was found

shapiro.test(resid(fmodel))  # p = 0..5893 residuals are normally distributed.

cooks.distance(fmodel)

# Calculate Cook's Distance for the model
cook <- cooks.distance(fmodel)

# Identify influential observations (threshold = 4/n)
influential_obs <- which(cook > 4/nrow(House_price))
print(influential_obs)  # Returns row indices of influential points

# Extract the summary
model_summary <- summary(fmodel)

# Extract t-values (excluding intercept)
t_values <- model_summary$coefficients[-1, "t value"]  # Removing the intercept

# Create a data frame for plotting
plot_data <- data.frame(Variable = names(t_values),t_value = t_values)

# Create the bar chart
ggplot(plot_data, aes(x = Variable, y = t_value)) +
  geom_bar(stat = "identity", fill = "blue") + 
  labs(title = "Level of Importance of Price Predictors",x = "Price Predictor",y = "Price Effect") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 10)) +
  theme(plot.title = element_text(hjust = 0.5))

# Standardize variables (mean = 0, SD = 1)
house_price_scaled <- scale(House_price)

# Convert to data frame
house_price_scaled <- as.data.frame(house_price_scaled)

# Add House_Price (not scaled)
house_price_scaled$House_Price <- House_price$House_Price

# Fit the model with standardized predictors
scaled_model <- lm(House_Price ~ ., data = house_price_scaled)
summary(scaled_model)
