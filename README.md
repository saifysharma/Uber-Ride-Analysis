# Uber Ride Analysis

**Python + SQL + Power BI analysis of Uber ride bookings to evaluate booking performance, unsuccessful bookings, operational efficiency, vehicle performance, revenue, customer experience, and ride patterns.**

## Business Problem

Uber receives a large volume of ride booking requests, but a significant portion of bookings do not result in completed rides due to customer cancellations, driver cancellations, unavailable drivers, and incomplete rides.

These unsuccessful bookings can reduce revenue, affect operational efficiency, and negatively impact the customer experience.

The business needs to understand where, when, and why booking failures occur to improve ride completion and operational performance.

## Business Objective

Analyze **booking performance, unsuccessful bookings, cancellation behavior, vehicle performance, location performance, revenue, customer experience, and ride patterns** to identify operational issues and provide actionable business recommendations.

## Dataset

**Uber Ride Analytics Dataset 2024 — Kaggle**

The dataset contains approximately **150,000 ride bookings** and **21 columns** covering booking information, booking status, customers, vehicle types, pickup and drop locations, cancellation details, driver arrival time, booking value, ride distance, ratings, and payment methods.

The dataset was used for **Python-based data cleaning and preparation, SQL business analysis, and Power BI visualization**.

## Tools

- **Python** — Data cleaning, preparation, validation, and exploratory analysis
- **MySQL / SQL** — Business analysis and calculations
- **Power BI** — Interactive dashboard, KPIs, DAX, and visualization
- **Kaggle** — Dataset source

## Analysis

### Python — Data Cleaning & Preparation

- Inspected dataset structure, data types, and descriptive statistics
- Analyzed missing values and duplicate records
- Validated categorical and numerical data
- Converted Date and Time fields and created useful Date & Time attributes
- Performed exploratory analysis and final data validation

### SQL — Business Analysis

- Analyzed booking outcomes, completion rates, and unsuccessful bookings
- Investigated customer and driver cancellation reasons
- Evaluated vehicle and pickup location performance
- Analyzed demand, unsuccessful rates, VTAT, and revenue
- Identified high-demand locations with poor completion rates

### Power BI — Dashboard & Visualization

Built a five-page Power BI dashboard covering:

- Executive Business Overview
- Operations & Unsuccessful Bookings
- Revenue & Performance
- Vehicle Performance
- Location & Ride Patterns

The dashboard communicates booking performance, cancellations, revenue, vehicle performance, location patterns, ratings, and time-based ride demand.

## Key Insights

### Booking Performance

- **150K bookings** were analyzed, with **93K completed rides**.
- Overall **completion rate was 62%**, with **57K unsuccessful bookings**.
- **Driver cancellations** were the largest unsuccessful booking category with **27K bookings**.

### Operations

- Several pickup locations recorded **40%+ unsuccessful booking rates**, indicating location-specific operational issues.
- **No Driver Found** bookings were concentrated in specific pickup locations, highlighting driver availability gaps.
- Some high-demand locations had **below-average completion rates**, representing potential revenue recovery opportunities.

### Time & Demand

- **Evening** was the highest-demand time period.
- **6 PM** was the busiest hour, with approximately **12.4K bookings**.
- Unsuccessful booking rates remained relatively high across several hours, indicating that failures are not limited to a single time period.

### Vehicle & Revenue

- **Auto** generated the highest completed booking value at approximately **11.7M**.
- **Go Sedan** had the highest average booking value at approximately **512**.
- Average VTAT was similar between completed and unsuccessful bookings, suggesting that **driver arrival time alone does not explain booking failures**.

## Business Recommendations

1. **Prioritize high-demand, low-completion locations** by improving driver allocation and supply availability.
2. **Reduce driver cancellations** through better driver support, monitoring, and targeted incentives.
3. **Improve driver availability in No Driver Found hotspots** using location-based incentives and demand forecasting.
4. **Prepare for peak demand periods**, particularly around the evening peak.
5. **Investigate high-unsuccessful locations individually** to identify their primary operational causes.
6. **Monitor vehicle performance by location and time period** to identify specific operational opportunities.

## Power BI Dashboard

The Power BI report contains five analytical pages:

**Executive Business Overview | Operations & Unsuccessful Bookings | Revenue & Customer Insights | Vehicle Performance | Location & Ride Patterns**

### Executive Business Overview

[Executive Business Overview](PowerBI/01_Executive_Business_Overview.png)

### Operations & Unsuccessful Bookings

[Operations & Unsuccessful Bookings](PowerBI/02_Operations_and_Unsuccessful_Bookings.png)

### Revenue & Customer Insights

[Revenue & Customer Insights](PowerBI/03_Revenue_and_Customer_Insights.png)

### Vehicle Performance

[Vehicle Performance](PowerBI/04_Vehicle_Performance.png)

### Location & Ride Patterns

[Location & Ride Patterns](PowerBI/05_Location_and_Ride_Patterns.png)

## Project Deliverables

- Python data cleaning and preparation notebook
- SQL database and business analysis files
- Power BI dashboard with 5 analytical pages
- 5 dashboard page previews
- Business insights
- Actionable business recommendations

## Outcome

The project demonstrates how **Python can be used to prepare and validate business data, SQL can be used to investigate business and operational questions, and Power BI can be used to communicate analytical findings through interactive dashboards and actionable business insights.**

