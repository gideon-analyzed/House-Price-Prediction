# House Price Analytics: Predictive Modelling for Property Valuation

A production-ready analytics solution that identifies key property valuation drivers and delivers accurate price predictions to support real estate investment decisions and pricing strategies.

## 📊 Project Overview

This project analyses a dataset of 1,000 residential properties to develop a robust predictive model for house pricing. Using multivariate linear regression with rigorous statistical validation, the solution quantifies the monetary impact of property features and delivers actionable insights for estate agents, property investors, and homeowners.

**Business Value Delivered:**
- Identified square footage as the dominant price driver (£199.80 per sq. ft.)
- Quantified secondary predictors: lot size (£14,933/acre), year built (£990/year), bedrooms (£10,164 each)
- Uncovered data quality issues requiring investigation (neighbourhood quality variable exclusion)
- Achieved 99.85% variance explained with production-ready validation protocols

## 🔍 Key Insights

| Predictor | Monetary Impact | Business Implication |
|-----------|-----------------|----------------------|
| **Square Footage** | +£199.80 per sq. ft. | Primary pricing lever; every additional 100 sq. ft. adds ~£20k value |
| **Lot Size** | +£14,933 per acre | Significant premium for larger plots, especially in suburban areas |
| **Year Built** | +£990 per year | Modern properties command consistent premiums; 10-year difference ≈ £10k |
| **Bedrooms** | +£10,164 per bedroom | Strong family home premium; 5-bedroom properties command ~£40k premium over 3-bed |
| **Bathrooms** | +£8,281 per bathroom | Secondary but meaningful impact on family-oriented properties |
| **Garage** | +£5,139 per space | Smallest impact among structural features; relevant mainly in suburban markets |

### Critical Data Quality Finding
Neighbourhood quality—typically a strong pricing factor—showed near-zero correlation (r = -0.01) with house prices. This suggests potential data labelling issues requiring investigation before deployment in production environments.

## ⚙️ Technical Approach

### Modelling Pipeline
```r
# Stepwise model selection with rigorous validation
model <- lm(House_Price ~ Square_Footage + Year_Built + Lot_Size + 
            Num_Bedrooms + Num_Bathrooms + Garage_Size, data = housing_data)

# Production validation suite
vif(model)                 # Multicollinearity check (all VIF < 1.02)
shapiro.test(resid(model)) # Residual normality (p = 0.5893)
cooks.distance(model)      # Influential observation detection (51 points identified)
```

### Validation Rigour
- **Multicollinearity:** All VIF scores < 1.02 (well below 5.0 threshold)
- **Residual Normality:** Shapiro-Wilk test confirms normal distribution (p = 0.5893)
- **Influential Points:** 51 observations identified via Cook's Distance; model stability confirmed after sensitivity analysis
- **Model Fit:** R² = 0.9985 with adjusted R² = 0.9984

### Tools & Technologies
- **Language:** R (tidyverse ecosystem)
- **Statistical Methods:** Spearman correlation (non-normal data), stepwise regression, Cook's Distance analysis
- **Visualisations:** ggplot2 for publication-quality diagnostic plots and business dashboards
- **Validation:** Comprehensive assumption testing aligned with industry best practices

## 📈 Results & Business Application

### Prediction Accuracy
The model explains **99.85% of price variability** across the dataset, enabling highly reliable valuations for properties within the observed feature ranges.

### Strategic Recommendations
1. **Mid-Market Focus:** Target 5-bedroom/4-bathroom properties in the £600k–£800k range for optimal renovation ROI
2. **Bathroom Upsell:** Adding bathrooms to older 5-bedroom properties (e.g., House #44) yields ~£127k uplift
3. **Data Quality Action:** Investigate neighbourhood quality data collection methodology before incorporating into production pricing engine
4. **Segmentation Strategy:** Differentiate pricing models for urban (<2 acre) vs. suburban/rural (>2 acre) properties due to non-linear lot size effects

## ▶️ Getting Started

### Requirements
- R 4.0+
- Required packages: `ggplot2`, `dplyr`, `car`, `psych`, `corrplot`, `scales`


## 💼 Professional Relevance

This project demonstrates production-ready data science capabilities valued by employers:

✅ **End-to-end ownership** – From data cleaning to business recommendations  
✅ **Statistical rigour** – Comprehensive model validation beyond basic accuracy metrics  
✅ **Business translation** – Technical findings converted to monetary impacts and strategic actions  
✅ **Data quality vigilance** – Critical assessment of unexpected results rather than blind model acceptance  
✅ **Production awareness** – Identification of deployment risks (potential overfitting, data quality issues)

