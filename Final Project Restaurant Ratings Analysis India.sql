create database indian_restaurant;
use indian_restaurant;
select * from customer;
select * from customer_preference;
select * from rating;
select * from restaurant;
select * from restaurant_cuisines;

select count(*) from customer;
select count(*) from customer_preference;
select count(*) from rating;
select count(*) from restaurant;
select count(*) from restaurant_cuisines;


#Performs aggregation finction on ratings table
#sum
select sum(Overall_Rating) from rating;
select sum(Food_Rating) from rating;
select sum(Service_Rating) from rating;
select sum(Value_for_Money) from rating;
 
#avg
select avg(Overall_Rating) from rating;
select avg(Food_Rating) from rating;
select avg(Service_Rating) from rating;
select avg(Value_for_Money) from rating;

#max
select max(Overall_Rating) from rating;
select max(Food_Rating) from rating;
select max(Service_Rating) from rating;
select max(Value_for_Money) from rating;

#min
select min(Overall_Rating) from rating;
select min(Food_Rating) from rating;
select min(Service_Rating) from rating;
select min(Value_for_Money) from rating;

select distinct * from rating
where Overall_Rating < 5;

#Local Insights
#Q1 Which City have most customer
select city, count(*) as total_customer
from customer
group by City
order by total_customer
limit 1;

#Q2 Age distribution by city/state
#city
SELECT City, Age, COUNT(*) AS total_customers
FROM customer
GROUP BY City, Age
ORDER BY City, Age;
#state
SELECT state, Age, COUNT(*) AS total_customers
FROM customer
GROUP BY state, Age
ORDER BY state, Age;

#Q3 Smoker vs non-smoker analysis
select smoker, count(*) as total_smoker
from customer
group by smoker;

#Q4 Transport method usage
select distinct Transport_Mode from customer;

# Restaurant Insights
#Q1 Restaurants count by city/state
#City
select city, count(*) as total_city_restaurant
from restaurant
group by city;

#state
select state, count(*) as total_state_restaurant
from restaurant
group by state;

#Q2 Price range vs ratings
SELECT
  r.Price_Range,
  AVG(food_Rating) AS avg_rating
FROM restaurant r
LEFT JOIN rating rv
  ON r.Restaurant_ID = rv.Restaurant_ID
GROUP BY r.Price_Range;

#Q3 Franchise vs non-franchise comparison
select franchise, count(*) as total_count
from restaurant
group by franchise;

#Q4 Parking availability analysis
select parking, count(*) as total_count
from restaurant
group by parking;

# Cuisine Insights
#Q1 Most preferred cuisine in Indiarestaurant
SELECT
  rc.Cuisine_type,
  COUNT(*) AS total_restaurants
FROM restaurant r
JOIN restaurant_cuisines rc
  ON r.Restaurant_ID = rc.Restaurant_ID
WHERE r.Country = 'India'
GROUP BY rc.Cuisine_type
ORDER BY total_restaurants DESC
LIMIT 1;

#Q2 Cuisine preference by age group

#Q3 Cuisine vs ratings

# Service & Quality

#Q1 Food vs Service rating comparison
SELECT
  AVG(Food_Rating) AS avg_food_rating,
  AVG(Service_Rating) AS avg_service_rating
FROM rating;

#Q2 Impact of alcohol service on ratings
SELECT
  r.Restaurant_Name,
  AVG(rr.Food_Rating) AS avg_food_rating,
  AVG(rr.Service_Rating) AS avg_service_rating
FROM restaurant r
JOIN rating rr
  ON r.Restaurant_ID = rr.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY avg_food_rating DESC;

#Q3 Value for money analysis


# Top Restaurants
#Q1 Top 5 restaurants by Overall Rating
SELECT
  r.Restaurant_Name,
  AVG(rr.Overall_Rating) AS avg_overall_rating
FROM restaurant r
JOIN rating rr
  ON r.Restaurant_ID = rr.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY avg_overall_rating DESC
LIMIT 5;


#Q2 Top 5 by Food Rating
SELECT
  r.Restaurant_Name,
  AVG(rr.Food_Rating) AS avg_food_rating
FROM restaurant r
JOIN rating rr
  ON r.Restaurant_ID = rr.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY avg_food_rating DESC
LIMIT 5;


#Q3 Top 5 by Service Rating
SELECT
  r.Restaurant_Name,
  AVG(rr.Service_Rating) AS avg_service_rating
FROM restaurant r
JOIN rating rr
  ON r.Restaurant_ID = rr.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY avg_service_rating DESC
LIMIT 5;
