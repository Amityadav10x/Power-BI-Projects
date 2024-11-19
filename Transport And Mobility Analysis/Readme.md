### **Transportation Domain Analysis Project**


#### **Project Overview**
This project focuses on analyzing transportation operations data to derive insights for a **Chief of Operations** role. The analysis aims to improve operational efficiency, understand demand trends, and optimize passenger satisfaction. The project leverages SQL for data preparation and analysis, with **Power BI** being used to create interactive visualizations for better decision-making.

---

### **Datasets**

#### 1. **fact_Trips**
This dataset contains granular trip-level information, including:
- **Columns**:
  - `trip_id`: Unique identifier for each trip.
  - `date`: Date of the trip.
  - `city_id`: City where the trip occurred.
  - `passenger_type`: Type of passenger (`new` or `repeated`).
  - `distance_travelled_km`: Distance of the trip in kilometers.
  - `fare_amount`: Revenue generated for the trip.
  - `passenger_rating`: Rating given by the passenger.
  - `driver_rating`: Rating given by the driver.

#### 2. **monthly_target_new_passengers**
Contains the monthly targets for acquiring new passengers in each city.
- **Columns**:
  - `month`: Month of the target.
  - `city_id`: City where the target applies.
  - `target_new_passengers`: Number of new passengers targeted for the month.

#### 3. **monthly_target_trips**
Details the target number of trips for each city on a monthly basis.
- **Columns**:
  - `month`: Month of the target.
  - `city_id`: City where the target applies.
  - `total_target_trips`: Number of trips targeted for the month.

#### 4. **fact_passenger_summary**
Summarizes passenger-related information, particularly for ratings:
- **Columns**:
  - `city_id`: City identifier.
  - `target_avg_passenger_rating`: The target average rating set for passengers in the city.

#### 5. **dim_city**
Provides metadata about cities.
- **Columns**:
  - `city_id`: City identifier.
  - `city_name`: Name of the city.

#### 6. **dim_date**
Contains details about dates to aid in time-based analysis.
- **Columns**:
  - `date`: Specific date.
  - `start_of_month`: Start date of the respective month.
  - `month_name`: Name of the month.
  - `day_type`: Indicates whether it is a weekday or weekend.

#### 7. **dim_repeat_trip_distribution**
Details the frequency of trips taken by repeat passengers.
- **Columns**:
  - `month`: Month of the data.
  - `city_id`: City identifier.
  - `trip_count`: Frequency of trips (e.g., 2-Trips, 10-Trips).
  - `repeat_passenger_count`: Number of repeat passengers in the respective frequency group.

#### 8. **fact_passenger_by_city_month**
Summarizes passenger data segmented by month and city.
- **Columns**:
  - `month`: Month of the data.
  - `city_id`: City identifier.
  - `new_passengers`: Count of new passengers for the month.
  - `repeat_passengers`: Count of repeat passengers for the month.
  - `total_passengers`: Total passengers (new + repeat) for the month.

---

### **Key Business Questions**
1. **Operational Insights**:
   - What are the top and bottom-performing cities by trip volume?
   - How does revenue growth vary monthly across cities?

2. **Passenger Insights**:
   - What is the average fare per trip by city?
   - How do passenger ratings compare between new and repeat passengers?

3. **Demand Analysis**:
   - Which months see the highest and lowest trip volumes for each city?
   - What is the distribution of demand across weekdays and weekends?

4. **Target Achievement**:
   - Are cities meeting their monthly targets for trips, new passengers, and average passenger ratings?
   - What factors influence target success rates?

---

### **Analysis Tools**
- **SQL**: Used for data cleaning, joining datasets, and generating insights by writing optimized queries.
- **Power BI**: Utilized for creating interactive dashboards to visualize:
  - Total trips, revenue, and distance traveled.
  - Ratings comparisons by city and passenger type.
  - Weekend vs. weekday demand.
  - Target achievement metrics and trends.

---

### **Visualizations**
The following Power BI visualizations are implemented for effective storytelling:
1. **Clustered Column Chart**:
   - Compares weekend vs. weekday demand by city.
2. **Heatmap**:
   - Highlights peak and low demand months by city using trip counts.
3. **Stacked Bar Chart**:
   - Analyzes repeat passenger frequency distribution across cities.
4. **Line and Column Chart**:
   - Displays average fare per trip and trip distances for pricing efficiency.
5. **Drill-Down Stacked Column Chart**:
   - Compares average ratings for passengers and drivers segmented by passenger type and city.

---

### **Project Purpose**
This project is part of the **Codebasics Resume Challenge**, aimed at building actionable insights for the **Chief of Operations** in the transportation domain. The analysis assists in understanding:
- Passenger trends and satisfaction levels.
- City-level performance metrics.
- Opportunities for optimizing operational strategies.

### **How This Project Stands Out**
- **Data-Driven Insights**: Strategic insights provided for city-specific challenges and opportunities.
- **Interactive Dashboards**: Power BI visualizations enable dynamic exploration of trends.
- **Scalable Approach**: The methodology can be applied to similar operational challenges in other domains.

---

### **Next Steps**
- Enhance Power BI dashboards by integrating real-time data sources.
- Explore predictive analytics using machine learning to forecast demand patterns.
- Suggest actionable strategies for improving repeat passenger loyalty and meeting targets.

---

### **About Me**
Hi! I’m ** AMIT **, an aspiring data analyst passionate about leveraging data to solve complex problems. I specialize in:
- SQL for data analysis.
- Power BI for interactive visualizations.
- Advanced Excel for data manipulation.

