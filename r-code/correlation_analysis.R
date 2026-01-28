# Correlation Analysis
# Check normality for key variables (Shapiro-Wilk test)
shapiro_results <- lapply(House_price, shapiro.test)
print(shapiro_results)  # If p < 0.05, use Spearman/Kendall

# Compute correlations 
corr_matrix <- rcorr(as.matrix(House_price[, sapply(House_price, is.numeric)]), 
                     type = "spearman")

# Extract House_Price correlations
house_price_cor <- corr_matrix$r["House_Price", ]
house_price_p <- corr_matrix$P["House_Price", ]

# Create a correlation table
cor_table <- data.frame(
  Correlation = round(house_price_cor, 2),
  p_value = round(house_price_p, 3))
print(cor_table)

#Residual normality (Shapiro-Wilk test)
shapiro.test(resid(fmodel))  # If p < 0.05, residuals are not normal

# Calculate Spearman correlations for numeric variables
cor_matrix <- cor(House_price[sapply(House_price, is.numeric)], 
                  method = "spearman", use = "complete.obs")

# Round to 2 decimal places
cor_matrix <- round(cor_matrix, 2)

# Print the Spearman correlation matrix
print(cor_matrix)

View(p) # p-values
View(r) # correlation coeeficeints

# Optionally, create a correlation heatmap visualization
corrplot(r, 
         method = "color", 
         type = "upper",
         tl.cex = 0.8,
         cl.cex = 0.8,
         title = "Correlation Matrix: House Price Variables",
         mar = c(0, 0, 1, 0))
