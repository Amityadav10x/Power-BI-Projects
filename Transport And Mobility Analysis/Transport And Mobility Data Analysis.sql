--  ------------------------------------------------------ Transport And Mobility Data Analysis ----------------------------

--                                                               Trip Metrics

-- What is the total number of trips for each city?

Select city_name,count(trip_id) as total_trips
from fact_trips  ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by total_trips desc

-- What is the total fare (revenue) generated by each city?

select city_name,sum(fare_amount) as total_revenue
from fact_trips ft
join dim_city dc
on  ft.city_id = dc.city_id
group by city_name
order by total_revenue desc

-- What is the average fare per trip for each city?

select city_name,avg(fare_amount) as avg_fare_amount
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_fare_amount desc

-- What is the average distance traveled per trip in each city?

select city_name,avg(distance_travelled_km) as avg_distence_travelled
from fact_trips	ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_distence_travelled desc

-- What is the total distance traveled across all cities?

select city_name,sum(distance_travelled_km) as total_distance_traveled
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by total_distance_traveled desc

-- Which city had the longest trip distance, and what was the distance?

select city_name,max(distance_travelled_km) as longest_trip_distance
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by longest_trip_distance desc

-- Which city had the shortest trip distance, and what was the distance?

select city_name, min(distance_travelled_km) as shortest_trip_distence
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by shortest_trip_distence asc

-- What is the average passenger rating for each city?

select city_name,avg(passenger_rating) as avg_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_rating desc

-- What is the average driver rating for each city?

select city_name,avg(driver_rating) as avg_driver_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_driver_rating desc

-- How many trips were taken by new passengers vs. repeat passengers in each city?

select city_name,sum(new_passengers) as new_passenger, sum(repeat_passengers) as repeat_passenger
from fact_passenger_summary fps
join dim_city dc
on fps.city_id = dc.city_id
group by city_name
order by new_passenger desc, repeat_passenger

--                                                     Demand Patterns

-- What are the peak demand months (highest trips) for each city?

select city_name,month_name,count(trip_id) as total_trips
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
group by city_name, month_name
order by total_trips desc

-- What are the low-demand months (lowest trips) for each city?

select city_name,month_name,count(trip_id) as total_trips
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
group by city_name, month_name
order by total_trips asc

-- What is the total number of trips taken on weekdays vs. weekends in each city?

select city_name,day_type,count(trip_id) as total_trip
from fact_trips ft
join dim_date dt
on ft.date = dt.date
join dim_city dc
on dc.city_id = ft.city_id
group by city_name, day_type
order by total_trip desc

-- Which city has the highest preference for weekend trips?

select city_name, day_type, count(trip_id) as trip_count
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
where day_type = 'Weekend'
group by city_name, day_type
order by trip_count desc

-- Which city has the highest preference for weekday trips?

select city_name, day_type, count(trip_id) as trip_count
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
where day_type = 'Weekday'
group by city_name, day_type
order by trip_count desc

--                                                         Repeat Passenger Analysis

-- What is the repeat passenger rate (RPR%) for each city?

select city_name,
(sum( case when passenger_type = 'repeated' then 1 else 0 end) * 100/ count(trip_id)) as repeated_assenger_rate
from fact_trips 
join dim_city 
on fact_trips.city_id = dim_city.city_id
group  by city_name
order by repeated_assenger_rate desc

-- Which city has the highest repeat passenger rate, and what is it?

select city_name,
(max(case when passenger_type = 'repeated' then 1 else 0 end) * 100 / count(trip_id)) as repeated_passenger_rate
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by repeated_passenger_rate desc


--                                                             City Insights

-- What are the top 3 and bottom 3 cities by total trips over the entire analysis period?

-- top
select top 3 city_name, count(trip_id) total_trip
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group  by city_name
order by total_trip desc

-- bottom
select top 3 city_name, count(trip_id) total_trip
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group  by city_name
order by total_trip asc


-- What are the top 3 and bottom 3 cities by revenue over the entire analysis period?

-- Top
select top 3 city_name, month_name,sum(fare_amount) as total_revenue
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
group by city_name, month_name
order by total_revenue desc

-- bottom  
select top 3 city_name, month_name,sum(fare_amount) as total_revenue
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
join dim_date dt
on dt.date = ft.date
group by city_name, month_name
order by total_revenue asc


-- Which city has the highest average passenger rating, and what is the rating?

select top 1 city_name, avg(passenger_rating) as avg_passenger_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_passenger_rating desc

-- Which city has the lowest average passenger rating, and what is the rating?

select top 1 city_name, avg(passenger_rating) as avg_passenger_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_passenger_rating asc

-- Which city has the highest average driver rating, and what is the rating?

-- Top

select city_name, avg(driver_rating) as avg_driver_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_driver_rating desc

-- bottom 

select city_name, avg(driver_rating) as avg_driver_rating
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by avg_driver_rating asc

--                                                          Operational Insights

-- How many trips were completed each month in each city?

select city_name,count(trip_id) as trip_count
from fact_trips ft
join dim_city dc
on ft.city_id = dc.city_id
group by city_name
order by trip_count desc

-- Trips target achievement rate by city

select city_name, mtt.total_target_trips, 
count(ft.trip_id) as actual_trips,
(count(ft.trip_id) - mtt.total_target_trips) * 100 / mtt.total_target_trips as target_achievement_rate
from monthly_target_trips mtt
join fact_Trips ft 
on mtt.city_id = ft.city_id
join dim_city dc
on dc.city_id = ft.city_id
group by city_name, mtt.total_target_trips
order by target_achievement_rate desc
