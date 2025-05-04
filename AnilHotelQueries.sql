#write a query that returns a list of reservations that end in july 2023
SELECT *
FROM reservation;
SELECT *
FROM guest;
SELECT *
FROM roomdata;
SELECT *
FROM roomamenities;
SELECT *
FROM amenities;

# 1Write a query that returns a list of reservations that end in July 2023, 
# including the name of the guest, the room number(s), and the reservation dates.
SELECT r.ReservationID
FROM reservation AS r
WHERE r.EndDate >='2023-07-01' AND r.EndDate <= '2023-07-31';

#Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, 
#the room number, and the dates of the reservation.

SELECT
g.FirstName,
g.LastName,
r.StartDate,
r.EndDate,
rd.RoomNumber

FROM reservation AS r
JOIN guest AS g ON r.GuestID = g.GuestID
JOIN roomdata AS rd ON r.RoomID = rd.RoomID
JOIN roomamenities AS ra ON rd.RoomID = ra.RoomID
WHERE ra.AmenityID = 3 ;

#3.	Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. 
#(Choose a guest's name from the existing data.)

SELECT
g.FirstName,
g.LastName,
r.StartDate,
(r.Adults + r.Children) AS TotalGuests,
rd.RoomNumber
FROM guest as g
JOIN reservation AS r ON g.GuestID = r.GuestID
JOIN roomdata AS rd ON r.RoomID = rd.RoomID
WHERE g.FirstName = 'Mack' AND g.LastName = 'Simmer';

#Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
#The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT 
    rd.RoomNumber,
    r.ReservationID,
    r.TotalRoomCost
FROM RoomData rd
LEFT JOIN Reservation r ON rd.RoomID = r.RoomID;

# Gets all the rooms that more than maximum of 3 occupencies or the rooms that have been reserved for April
SELECT DISTINCT rd.RoomNumber, rd.StandardOccupancy, rd.MaximumOccupancy, r.StartDate, r.EndDate
FROM RoomData rd
JOIN Reservation r ON rd.RoomID = r.RoomID
WHERE (rd.StandardOccupancy >= 3 OR rd.MaximumOccupancy >= 3)
AND NOT (r.EndDate < '2023-04-01' OR r.StartDate > '2023-04-30');

#
SELECT 
    g.FirstName,
    g.LastName,
    COUNT(r.ReservationID) AS ReservationCount
    FROM Guest AS g 
    LEFT JOIN reservation AS r ON g.GuestID = r.GuestID
    
# were saying here group based on the GuestID, we include the First and Last name so we know who the customers are
    GROUP BY g.GuestID, g.FirstName, g.LastName
    ORDER BY ReservationCount Desc;

# Getting information on guest based on phone number
SELECT 
    FirstName,
    LastName,
    Address,
    City,
    State,
    Zip,
    Phone
FROM Guest
WHERE Phone = '(291) 553-0508';
