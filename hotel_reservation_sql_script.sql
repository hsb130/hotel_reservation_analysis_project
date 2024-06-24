/* 1. What is the total number of reservations in the dataset? */

# The total number of reservations that are not cancelled until now :


select count(Booking_ID) as count_of_confirmed_reservations
from hotel_reservation_dataset
where booking_status='Not_Canceled';



select count(Booking_ID) as count_of_cancelled_reservations
from hotel_reservation_dataset
where booking_status='Canceled';


select count(Booking_ID) as Total_reservations
from hotel_reservation_dataset;


# we see that the total reservations  = 493 (not cancelled yet)
# also, the amount of reservations cancelled  = 207
# so, total reservations made = 700

/* 2. Which meal plan is the most popular among guests? */

SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS count_of_meal_plan
FROM hotel_reservation_dataset
GROUP BY type_of_meal_plan
ORDER BY count_of_meal_plan DESC;

# seems like meal plan 1 is most popular.




/* 3. What is the average price per room for reservations involving children? */

select avg(avg_price_per_room)
from hotel_reservation_dataset 
where no_of_children > 0 ;

# looks like the average price per room that includes children is = 144.1875





/*4. How many reservations were made for the year 20XX (replace XX with the desired year)?*/

SELECT
    YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS year,
    COUNT(Booking_ID) AS total_reservations
FROM hotel_reservation_dataset
WHERE STR_TO_DATE(arrival_date, '%d-%m-%Y') IS NOT NULL
GROUP BY year
HAVING year = 2018;

# in 2018 there was 577 tota reservations.


/*5. What is the most commonly booked room type?*/

select room_type_reserved , count(room_type_reserved)as Total_Count
from hotel_reservation_dataset 
group by room_type_reserved
order by Total_Count DESC;

# the most commonly booked room type =1. 


/*6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?*/

select count(Booking_ID)
from hotel_reservation_dataset 
where no_of_weekend_nights > 0;

# the answer is 383.



/*7. What is the highest and lowest lead time for reservations?*/
select max(lead_time), min(lead_time)
from hotel_reservation_dataset ;

# max = 443, min = 0.





/*8. What is the most common market segment type for reservations?*/

select market_segment_type,count(market_segment_type)as COUNT_of_segment
from hotel_reservation_dataset 
group by market_segment_type
order by COUNT_of_segment DESC;

# the most common market segment = online 



/*9. How many reservations have a booking status of "Confirmed"?*/

# The total number of reservations that are not cancelled until now :
select count(Booking_ID) as count_of_confirmed_reservations
from hotel_reservation_dataset
where booking_status='Not_Canceled';

# answer = 493

/*10. What is the total number of adults and children across all reservations?*/

select sum(no_of_adults), sum(no_of_children)
from hotel_reservation_dataset 
where booking_status='Not_Canceled';

# sum of adults = 914 (confirmed)
# sum of children = 38 (confirmed)

select sum(no_of_adults), sum(no_of_children)
from hotel_reservation_dataset 
where booking_status='Canceled';

# sum of adults = 402 (canceled)
# sum of children = 31 (canceled)

/*11. What is the average number of weekend nights for reservations involving children?*/

select avg(no_of_weekend_nights)
from hotel_reservation_dataset 
where  no_of_children > 0 and booking_status = 'Not_Canceled';

# answer = 1 (approx.)




/*12. How many reservations were made in each month of the year?*/

select month(STR_TO_DATE(arrival_date, '%d-%m-%Y')) as Month_Arrival,
       Year(STR_TO_DATE(arrival_date, '%d-%m-%Y')) as Year_Arrival,
       Count(Booking_ID)
from hotel_reservation_dataset 
group by Month_Arrival, Year_Arrival
order by Month_Arrival ASC, Year_Arrival ASC
; 






/*13. What is the average number of nights (both weekend and weekday) spent by guests for each room
type?*/


select room_type_reserved,avg(no_of_weekend_nights + no_of_week_nights) as AVG_Total_Nights
from hotel_reservation_dataset 
group by room_type_reserved;



/*14. For reservations involving children, what is the most common room type, and what is the average
price for that room type?*/

select room_type_reserved, avg(avg_price_per_room)
from hotel_reservation_dataset
where no_of_children >0
group by room_type_reserved
order by room_type_reserved;





/*15. Find the market segment type that generates the highest average price per room.*/

select market_segment_type, avg(avg_price_per_room) as AVG_PRICE
from hotel_reservation_dataset
group by market_segment_type
order by AVG_PRICE desc;
