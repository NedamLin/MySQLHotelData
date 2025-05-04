-- Drop and recreate the database
DROP DATABASE IF EXISTS MYHOTELAnil2;
CREATE DATABASE MYHOTELAnil2;
USE MYHOTELAnil2;

Select *
FROM roomamenities;
-- Guest table
CREATE TABLE Guest (
    GuestID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(200),
    LastName VARCHAR(200),
    Address VARCHAR(200),
    City VARCHAR(100),
    State VARCHAR(7),
    Zip INT,
    Phone VARCHAR(15)
);

-- RoomData table with surrogate RoomID
CREATE TABLE RoomData (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber INT UNIQUE,
    Type VARCHAR(50),
    ADA BOOLEAN,
    StandardOccupancy INT,
    MaximumOccupancy INT,
    BasePrice DECIMAL(10,2),
    ExtraPerson DECIMAL(10,2)
);

-- Amenities table
CREATE TABLE Amenities (
    AmenityID INT AUTO_INCREMENT PRIMARY KEY,
    AmenityName VARCHAR(100) UNIQUE
);

-- RoomAmenities with RoomID instead of RoomNumber
CREATE TABLE RoomAmenities (
    RoomID INT,
    AmenityID INT,
    PRIMARY KEY (RoomID, AmenityID),
    FOREIGN KEY (RoomID) REFERENCES RoomData(RoomID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AmenityID) REFERENCES Amenities(AmenityID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Reservation table referencing RoomID and GuestID
CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    GuestID INT,
    Adults INT,
    Children INT,
    StartDate DATE,
    EndDate DATE,
    TotalRoomCost DECIMAL(10,2),
    FOREIGN KEY (RoomID) REFERENCES RoomData(RoomID),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);
#-------------------------------------------------------Guest Data-----------------------------------------------------
INSERT INTO Guest (FirstName, LastName, Address, City, State, Zip, Phone) VALUES
('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', 51501, '(291) 553-0508'),
('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', 99654, '(478) 277-9632'),
('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', 78552, '(308) 494-0198'),
('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', 08096, '(214) 730-0298'),
('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', 48601, '(377) 507-0974'),
('Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', 80003, '(814) 485-2615'),
('Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', 60099, '(279) 491-0960'),
('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', 02864, '(446) 396-6785'),
('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', 13126, '(834) 727-1001'),
('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', 22015, '(446) 351-6860'),
('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', 19026, '(231) 893-2755'),
('Anil', 'Maden', '939 DooDoo.', 'DAA', 'DA', 90210, '(446) 444-4444'),
('Aisha', 'SN', '939 TaaTaa.', 'TAA', 'TA', 90211, '(446) 333-3333');

#-------------------------------------------------------ROOM DATA-----------------------------------------------------
INSERT INTO RoomData (RoomNumber, Type, ADA, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) VALUES
(201, 'Double', FALSE, 2, 4, 199.99, 10.00),
(202, 'Double', TRUE, 2, 4, 174.99, 10.00),
(203, 'Double', FALSE, 2, 4, 199.99, 10.00),
(204, 'Double', TRUE, 2, 4, 174.99, 10.00),
(205, 'Single', FALSE, 2, 2, 174.99, NULL),
(206, 'Single', TRUE, 2, 2, 149.99, NULL),
(207, 'Single', FALSE, 2, 2, 174.99, NULL),
(208, 'Single', TRUE, 2, 2, 149.99, NULL),
(301, 'Double', FALSE, 2, 4, 199.99, 10.00),
(302, 'Double', TRUE, 2, 4, 174.99, 10.00),
(303, 'Double', FALSE, 2, 4, 199.99, 10.00),
(304, 'Double', TRUE, 2, 4, 174.99, 10.00),
(305, 'Single', FALSE, 2, 2, 174.99, NULL),
(306, 'Single', TRUE, 2, 2, 149.99, NULL),
(307, 'Single', FALSE, 2, 2, 174.99, NULL),
(308, 'Single', TRUE, 2, 2, 149.99, NULL),
(401, 'Suite', TRUE, 3, 8, 399.99, 20.00),
(402, 'Suite', TRUE, 3, 8, 399.99, 20.00);

#-------------------------------------------------------Amenitites DATA-----------------------------------------------------
INSERT INTO Amenities (AmenityName) VALUES
('Oven'),
('Microwave'),
('Jacuzzi'),
('Refrigerator');
#-------------------------------------------------------Room Amenitites DATA-----------------------------------------------------
INSERT INTO RoomAmenities (RoomID, AmenityID) VALUES
(1, 2), (1, 3),         -- Room 201
(2, 4),                -- Room 202
(3, 2), (3, 3),         -- Room 203
(4, 4),                -- Room 204
(5, 2), (5, 4), (5, 3), -- Room 205
(6, 2), (6, 4),         -- Room 206
(7, 2), (7, 4), (7, 3), -- Room 207
(8, 2), (8, 4),         -- Room 208
(9, 2), (9, 3),         -- Room 301
(10, 4),               -- Room 302
(11, 2), (11, 3),       -- Room 303
(12, 4),               -- Room 304
(13, 2), (13, 4), (13, 3), -- Room 305
(14, 2), (14, 4),       -- Room 306
(15, 2), (15, 4), (15, 3), -- Room 307
(16, 2), (16, 4),       -- Room 308
(17, 2), (17, 4), (17, 1), -- Room 401
(18, 2), (18, 4), (18, 1); -- Room 402
#-------------------------------------------------------Reservation DATA-----------------------------------------------------
INSERT INTO Reservation (RoomID, GuestID, Adults, Children, StartDate, EndDate, TotalRoomCost) VALUES
-- February 2023
(16, 1, 1, 0, '2023-02-02', '2023-02-04', 299.98),
(3, 2, 2, 1, '2023-02-05', '2023-02-10', 999.95),
(13, 3, 2, 0, '2023-02-22', '2023-02-24', 349.98),
(1, 4, 2, 2, '2023-03-06', '2023-03-07', 199.99),

-- March 2023
(15, 12, 1, 1, '2023-03-17', '2023-03-20', 524.97),
(10, 5, 3, 0, '2023-03-18', '2023-03-23', 924.95),
(2, 6, 2, 2, '2023-03-29', '2023-03-31', 349.98),
(12, 7, 2, 0, '2023-03-31', '2023-04-05', 874.95),

-- April 2023
(9, 8, 1, 0, '2023-04-09', '2023-04-13', 799.96),
(7, 9, 1, 1, '2023-04-23', '2023-04-24', 174.99),

-- May 2023
(17, 10, 2, 4, '2023-05-30', '2023-06-02', 1199.97),

-- June 2023
(6, 11, 2, 0, '2023-06-10', '2023-06-14', 599.96),
(8, 11, 1, 0, '2023-06-10', '2023-06-14', 599.96),
(12, 5, 3, 0, '2023-06-17', '2023-06-18', 184.99),
(5, 13, 2, 0, '2023-06-28', '2023-07-02', 699.96),

-- July 2023
(4, 8, 3, 1, '2023-07-13', '2023-07-14', 184.99),
(17, 9, 4, 2, '2023-07-18', '2023-07-21', 1259.97),
(11, 2, 2, 1, '2023-07-28', '2023-07-29', 199.99),

-- August 2023
(13, 2, 1, 0, '2023-08-30', '2023-09-01', 349.98),

-- September 2023
(8, 1, 2, 0, '2023-09-16', '2023-09-17', 149.99),
(3, 4, 2, 2, '2023-09-13', '2023-09-15', 399.98),

-- November 2023
(17, 3, 2, 2, '2023-11-22', '2023-11-25', 1199.97),
(6, 1, 2, 0, '2023-11-22', '2023-11-25', 449.97),
(9, 1, 2, 2, '2023-11-22', '2023-11-25', 599.97),

-- December 2023
(10, 10, 2, 0, '2023-12-24', '2023-12-28', 699.96);

