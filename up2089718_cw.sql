CREATE DATABASE up2089718_cw;
\c up2089718_cw

CREATE TABLE ROLE(
ROLE_ID SERIAL PRIMARY KEY,
ROLE_NAME VARCHAR(50) NULL);

CREATE TABLE STAFF(
STAFF_ID SERIAL PRIMARY KEY,
STAFF_FNAME VARCHAR(35) NOT NULL,
STAFF_LNAME VARCHAR(35) NOT NULL,
ADDR VARCHAR(100) NOT NULL,
POSTCODE VARCHAR(20) NOT NULL,
WORK_EMAIL VARCHAR(150) NOT NULL);

CREATE TABLE CUSTOMER (
CUST_ID SERIAL PRIMARY KEY,
CUST_FNAME VARCHAR(35) NOT NULL,
CUST_LNAME VARCHAR(35) NOT NULL,
ADDR VARCHAR(100) NOT NULL,
POSTCODE VARCHAR(20) NOT NULL,
EMAIL VARCHAR(150) NOT NULL,
TELEPHONE VARCHAR(35) NOT NULL,
BANK_DETAILS VARCHAR(255) NOT NULL);

CREATE TABLE BOAT_YARD(
BOAT_YARD_ID SERIAL PRIMARY KEY,
BOAT_YARD_NAME VARCHAR(25) NOT NULL,
ADDRESS VARCHAR(150) NOT NULL,
EMAIL VARCHAR(150) NOT NULL,
TELEPHONE VARCHAR(35) NOT NULL);

CREATE TABLE STAFF_ROLE(
STAFF_ROLE_ID SERIAL PRIMARY KEY,
STAFF_ID int NOT NULL REFERENCES STAFF(STAFF_ID),
ROLE_ID int NOT NULL REFERENCES ROLE(ROLE_ID),
BOAT_YARD_ID int NOT NULL REFERENCES BOAT_YARD(BOAT_YARD_ID));

SELECT s.staff_id AS ID, s.staff_fname AS Staff_F, s.staff_lname AS Staff_L, r.role_name, r.role_id
FROM staff s
INNER JOIN role r
ON s.staff_id = r.role_id;
/* creates a join between role_id and staff_id */

create type bool2yesno as enum ('YES','NO');
/* creates custom data type for yes/ no instead of true/false */


CREATE TABLE SERVICING(
SERVICING_ID SERIAL PRIMARY KEY,
SERVICE_NAME VARCHAR(50) NOT NULL,
COST VARCHAR(15) NOT NULL);

CREATE TABLE BOAT_DETAILS(
BOAT_ID SERIAL PRIMARY KEY,
BOAT_NAME VARCHAR(50) NOT NULL,
DIMENSIONS VARCHAR(25),
FUEL_TYPE VARCHAR(40) NOT NULL,
ENGINE_SIZE VARCHAR(15) NOT NULL,
CAPACITY VARCHAR(50) NOT NULL,
DOCK_NUM INT NOT NULL,
MKE_DATE DATE NOT NULL,
CUST_ID INT NOT NULL REFERENCES CUSTOMER(CUST_ID),
STAFF_ID INT NOT NULL REFERENCES STAFF(STAFF_ID),
BOAT_YARD_ID INT NOT NULL REFERENCES BOAT_YARD(BOAT_YARD_ID),
SERVICING_ID INT NOT NULL REFERENCES SERVICING(SERVICING_ID));

/* boat_details contains all information pertaining to staff in charge, info of the boat, type of service and the customer it belongs to*/


CREATE TABLE BOAT_SERVICE(
BOAT_SERVICE_ID SERIAL PRIMARY KEY,
SERVICE_DATE DATE NOT NULL,
SERVICE_COMPLETION BOOL2YESNO NOT NULL,
PRE_BOOKED BOOL2YESNO NOT NULL,
BOAT_ID INT NOT NULL REFERENCES BOAT_DETAILS(BOAT_ID));
/* boat_service has information of bookings, dates and completion of boat service using the custom data type for yes/ no for easier readability */


SELECT c.cust_id AS ID, c.cust_fname AS CustomerF, c.cust_lname AS CustomerL, b.Boat_name AS Boats, b.Fuel_type AS Fuel
FROM customer c
INNER JOIN boat_details b
ON c.cust_id = b.cust_id;
/* join’s the customer_id and the boat_details together*/

Insert into role(role_name) values('Manager');
Insert into role(role_name) values('Glass_Fibre_Specialist');
Insert into role(role_name) values('Engine_Technician');
Insert into role(role_name) values('Electrician');
Insert into role(role_name) values('General_Technician');

--boat Yard Details

insert into boat_yard (boat_yard_name, address, email, telephone) values ('Portsmouth boats', 'Clarence Esplanade, Southsea PO5 3PB', 'portsboats@gmail.com', '0800 8647485');
insert into boat_yard (boat_yard_name, address, email, telephone) values ('Havant boats', 'Bedhampton Quay, Harts Farm Way, Havant PO9 1JN', 'havant@gmail.com', '0800 4708140');
insert into boat_yard (boat_yard_name, address, email, telephone) values ('Lee-on-solent Boats', '178 Portsmouth Rd, Lee-on-the-Solent PO13 9AB', 'losboats@gmail.com', '0800 1742784');
insert into boat_yard (boat_yard_name, address, email, telephone) values ('North solent boats', 'Beaulieu, Brockenhurst SO42 7XG', 'solboats@gmail.com', '0800 8221483');

--Servicing Details

Insert into servicing(service_name,cost) values('General Maintenence', '£180');
Insert into servicing(service_name,cost) values('Boat servicing', '£200');
Insert into servicing(service_name,cost) values('Engineering and Mechanics', '£40 per hour');
Insert into servicing(service_name,cost) values('Welding', '£300');
Insert into servicing(service_name,cost) values('Fibre Glass Repairs', '£150');

--Staff roles
Insert into staff_role(staff_id,role_id,boat_yard_id) values(1, 1, 1);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(2, 2, 2);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(3, 3, 3);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(4, 2, 4);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(5, 5, 1);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(6, 1, 2);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(7, 4, 3);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(8, 1, 4);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(9, 4, 1);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(10, 1, 2);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(11, 4, 3);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(12, 5, 4);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(13, 2, 1);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(14, 3, 2);
Insert into staff_role(staff_id,role_id,boat_yard_id) values(15, 5, 3);

--staff infomation

insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Hansiain', 'sweeney', '36 aston road','po4 9bh','hsweeney0@4gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Mureil', 'Bubbins', '48 spencer road','po6 2gk', 'mbubbins0@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Samantha', 'Wearden', '46 ingersol road','po2 5xd', 'mwearden@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Ethan', 'Mobius', '26 Ludington Terrace','po1 4dr', 'emobius@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Florenza', 'Pidgeley', '71 Black bird Place','po7 9ya', 'fpidgeley@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Taryn', 'Harking', '39 Queens road', 'po7 7sb', 'tharking@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Andras', 'Barthel', '71 privett road', 'po7 5hj', 'abarthel@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Scott', 'Londbough', '4 Acker road','PO5 0QP', 'slondboughgmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('William', 'Broadfoot', '167 Corset road', 'PO8 8DB', 'wboradfoot@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Lana', 'willarton', '19 Forest Avenue', 'PO3 3 EW', 'lwillarton@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Serena', 'lurcher', '50 bluestem road', 'PO4 0GL', 'slurcher@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Ethan', 'Upney', '96 Oak fair pass', 'PO2 2RC', 'eupney@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Carrie', 'Kubyszek', '359 Tennessee cross', 'PO4 1GS', 'ckubyzek@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Emily', 'Rasp', '15 Mosinee Street', 'P03 1YZ', 'erasp@gmail.com');
insert into staff(staff_fname,staff_lname,addr,postcode,work_email) values('Adella', 'Wiffill', '58 Dennis Lane', 'PO9 4SF', 'awiffill@gmail.com');

--customer infomation

insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Talbot', 'Bracchi', '2 Donald Circle', 'po9 3yo', 'tbracchi12@unesco.org', '439-475-2800', '630484445191474358');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Merwin', 'Hallad', '44 Fisk Pass', 'po5 0nl', 'mhallad13@amazon.com', '996-506-1418', '5446116206304961');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Arluene', 'Dodworth', '00422 Iowa Center', 'po6 4bl', 'adodworth14@clickbank.net', '326-315-4634', '4017956639421');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Haily', 'Cuncarr', '23001 Lindbergh Way', 'po1 1ac', 'hcuncarr15@histats.com', '552-659-2362', '4405274707150029');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Vaughan', 'Donat', '50 Kipling Park', 'po6 4wk', 'vdonat16@phpbb.com', '683-916-6314', '3540647079191739');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Orbadiah', 'Trattles', '2 Ridgeway Alley', 'po8 3ej', 'otrattles17@nytimes.com', '280-363-6454', '5641827686178187');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Nichol', 'Grier', '85434 Bonner Avenue', 'po6 6er', 'ngrier18@edublogs.org', '630-935-3135', '6762121150911480255');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Beverley', 'Adamovitch', '6 Hanson Alley', 'po4 4ry', 'badamovitch19@elegantthemes.com', '247-848-8745', '50207568561155021');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Townsend', 'Rochford', '746 Shoshone Crossing', 'po9 9fl', 'trochford1a@columbia.edu', '881-569-7941', '3549083404401364');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Jackelyn', 'Devall', '70594 Maple Street', 'po7 7gu', 'jdevall1b@usa.gov', '955-492-0803', '374283366746584');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Rosaline', 'Murricanes', '2 Esch Junction', 'po8 8rl', 'rmurricanes1c@is.gd', '528-995-9529', '4175000059884016');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Maryellen', 'Whear', '67359 Kingsford Plaza', 'po2 0tl', 'mwhear1d@buzzfeed.com', '981-887-7903', '6706347534812374');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Bertina', 'Hunnicot', '6 Gale Pass', 'po5 5wh', 'bhunnicot1e@wikipedia.org', '104-881-4995', '3568816223716629');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Joy', 'Joicey', '3 Melrose Junction', 'Po3 3ft', 'jjoicey1f@reuters.com', '204-482-6271', '3568347852099921');
Insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Jescie', 'Gilmore', '3901 Turpis Rd', 'G3G 8BE', 'jgilmore@gmail.com', '077 2572 5176', '349684848878736');
Insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Griffith', 'Carpenter', '3860 Proin Ave', 'C14 7FO', 'gcarpenter@gmail.com', '(0141) 627 7246', '527 13375 51872 391');
Insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Zachary', 'Talley', '34 Netus Avenue', 'XG6H 4OT', 'ztalley@gmail.com', '0353 066 2895', '372458523873118');
Insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Valentine', 'Boone', 'P.O. Box 314, 9632 Est. Av', 'V21 5BC', 'vboone@gmail.com', '056 0879 8767', '512 88436 96676 626');
Insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Daria', 'Travis', 'Ap #759-4575 Ornare, Road', 'N10 2ZX', 'dtravis@gmail.com', '(01410) 448191', '5452 8723 6758 7172');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Zenia', 'Drinkall', '11746 Village Junction', 'po7 2jk', 'zdrinkallg@amazon.co.jp', '438-393-6827', '670974022760211900');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Thor', 'Feedham', '893 Helena Avenue', 'po9 onh', 'tfeedhamh@jigsy.com', '610-849-0580', '3564893272287806');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Concordia', 'Norree', '7485 Bonner Park', 'po2 2jo', 'cnorreei@soundcloud.com', '675-802-4106', '3543008576774971');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Elsworth', 'Nation', '77230 Holmberg Place', 'po9 5hl', 'enationj@jiathis.com', '886-559-5605', '67620950464095921');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Burlie', 'Shuttell', '09435 Kensington Lane', 'po5 3re', 'bshuttellk@paginegialle.it', '938-262-2825', '3577454352469924');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Marylynne', 'Tunnick', '5457 Lukken Point', 'po7 9hl', 'mtunnickl@earthlink.net', '281-112-6671', '3549024788271908');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Martita', 'Lackie', '8 Bunker Hill Plaza', 'po9 4yn', 'mlackiem@a8.net', '918-989-6312', '5602224791849869');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Cyndie', 'Coppen', '7002 Tomscot Crossing', 'po’3 4de', 'ccoppenn@google.nl', '870-302-3825', '201672114863171');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Theresita', 'O''Reilly', '6 Sutherland Point', 'po1 7qu', 'toreillyo@linkedin.com', '808-125-9527', '3584951503357842');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Gayelord', 'Camplin', '0640 Spaight Street', 'po4 7 eb', 'gcamplinp@fema.gov', '238-920-4255', '349860782749441');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Raynor', 'Manwell', '38511 Fisk Terrace', 'po8 6wb', 'rmanwellq@devhub.com', '892-662-4440', '30560144919765');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Natal', 'Thake', '885 Farragut Hill', 'po9 4rb', 'nthaker@europa.eu', '283-392-3148', '3559931974685450');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Inglis', 'Luisetti', '67633 Doe Crossing Junction', 'po’3 8qz', 'iluisettis@seattletimes.com', '372-349-0706', '5610470991956711');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Celestina', 'Yarranton', '8 Rockefeller Plaza', 'po3 8ar', 'cyarrantont@sun.com', '121-725-0754', '3565801021387461');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Faye', 'Duffus', '6 Oneill Trail', 'po9 3ae', 'fduffusu@parallels.com', '766-413-4798', '3532485693889986');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Lotti', 'Impett', '88 Vahlen Park', 'po6 7ts', 'limpettv@photobucket.com', '230-693-0474', '676771476495137305');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Sergeant', 'Van der Merwe', '0 Butterfield Street', 'po2 3ds', 'svandermerwew@oaic.gov.au', '295-594-5048', '201954258923981');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Tyler', 'Tuckwood', '54915 Fisk Pass', 'po5 3tn', 'ttuckwoodx@sbwire.com', '137-224-7369', '30369959861835');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Desi', 'Domnick', '6347 Heath Road', 'po2 4ed', 'ddomnicky@amazon.co.uk', '328-334-7396', '5100179408419182');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Nate', 'Ferres', '33640 Ludington Alley', 'po6 4fd', 'nferresz@nyu.edu', '354-358-1048', '3539649567212947');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Gerry', 'Ecclesall', '12 Grasskamp Center', 'po7 9gb', 'gecclesall10@wiley.com', '643-428-1241', '490337415055302621');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Jorey', 'Grattan', '012 Parkside Road', 'po6 9bk', 'jgrattan11@icio.us', '536-318-3227', '6759213534244815730');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Florrie', 'Rentalll', '25 Goodland Terrace', 'po8 3ql', 'frentalll12@livejournal.com', '202-932-0979', '201500811011267');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Reinhard', 'Paskin', '183 Emmet Trail', 'po5 4rt', 'rpaskin13@washington.edu', '121-182-2574', '5568786772781206');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Catherine', 'Evetts', '9666 Glendale Trail', 'po3 egk', 'cevetts0@imageshack.us', '574-486-1986', '5602238912776769');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Lindsay', 'Wane', '5283 Rockefeller Drive', 'po7 rdo', 'lwane1@aboutads.info', '987-514-2055', '3560851175903170');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Bili', 'Pesik', '0514 Commercial Lane', 'po0 6fu', 'bpesik2@wiley.com', '222-337-8391', '3575321367626123');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Jed', 'Fraczek', '740 Green Avenue', 'po5 bhw', 'jfraczek3@oaic.gov.au', '258-906-0033', '3554113182276076');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Cordie', 'Eagan', '67 Mitchell Point', 'po7 0qd', 'ceagan4@gov.uk', '528-783-1629', '6304002004926941');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Berrie', 'Swenson', '774 American Place', 'po7 0gh', 'bswenson5@bandcamp.com', '197-415-4494', '5285067045277310');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Julieta', 'Baldelli', '4 Sugar Street', 'po3 8di', 'jbaldelli6@ebay.co.uk', '883-220-6090', '3558492703869122');
insert into customer(cust_fname,cust_lname,addr,postcode,email,telephone,bank_details) values('Ambrosi', 'Duesbury', '10 Fordem Court', 'po7 osy', 'aduesbury7@cam.ac.uk', '836-884-1485', '3545089652732834');


--boat details

Insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sea doo jetski', '(L)331cm x (W)125cm x (H)114cm',  'petrol', '899cc',  '1-3 people',  '2017-05-21',  '2', '1','12','1','1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm ',  'Diesel', '5500cc',  '4 (1 double berth + 1 twin berth)',  '2016-02-01', '3', '2', '9', '2', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) 
values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '2', '3', '3', '3', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Westsail 32', '(L)1650cm x(W)920cm', 'diesel', '73020cc', '5 people', '1983-12-20', '4', '4', '13', '3', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sailing dinghy', '(L)250cm x (W)150cm', 'N/A', 'N/A', '1', '2019-07-15', '4', '5', '3', '1', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('southern cross 31', '(L)950cm x(W)720cm', 'diesel', '8430cc', '3 people', '1995-04-09', '3', '6', '7', '2', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '1', '7', '15', '3', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '3', '8', '12', '4', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '3', '9', '3', '1', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm ',  'Diesel', '5500cc',  '4 (1 double berth + 1 twin berth)',  '2016-02-01', '3', '10', '8', '2', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Southern cross 31', '(L)950cm x(W)720cm', 'diesel', '8430cc', '3 people', '1995-04-09', '4', '11', '5', '3', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people ', '1981-07-15', '1', '12', '10', '4', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Westsail 32', '(L)1650cm x(W)920cm', 'diesel', '73020cc', '5 people', '1983-12-20', '3', '13', '6', '1', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sailing dinghy', '(L)250cm x (W)150cm',  'N/A', 'N/A',  '1',  '2019-07-15', '3', '14', '2', '2', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '4', '16', '15', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm ',  'Diesel', '5500cc',  '4 (1 double berth + 1 twin berth)',  '2016-02-01', '1', '17', '9', '4', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '4', '18', '3', '1', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '3', '19', '14', '2', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sea doo jetski', '(L)331cm x (W)125cm x (H)114cm',  'petrol', '899cc',  '1-3 people',  '2017-05-21', '2', '20', '1', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people ', '1981-07-15', '1', '21', '6', '4', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Southern cross 31', '(L)950cm x(W)720cm', 'diesel', '8430cc', '3 people', '1995-04-09', '1', '22', '5', '1', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '4', '23', '11', '2', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm', 'Diesel', '5500cc',  '4 (1 double berth + 1 twin berth)',  '2016-02-01', '4', '24', '15', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '1', '25', '9', '4', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '4', '26', '4', '1', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '2', '27', '3', '2', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '3', '28', '6', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sailing dinghy', '(L)250cm x (W)150cm',  'N/A', 'N/A', '1', '2019-07-15', '3', '29', '2', '4', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '3', '30', '6', '1', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Westsail 32', '(L)1650cm x(W)920cm', 'diesel', '73020cc', '5 people', '1983-12-20', '2', '31', '4', '2', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '2', '32', '9', '3', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm ',  'Diesel', '5500cc',  '4 (1 double berth + 1 twin berth)',  '2016-02-01', '3', '33', '15', '4', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '1', '34', '10', '1', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '1', '35', '11', '2', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Southern cross 31', '(L)950cm x(W)720cm', 'diesel', '8430cc', '3 people', '1995-04-09', '2', '36', '12', '3', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '3', '37', '13', '4', '3');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sea doo jetski', '(L)331cm x (W)125cm x (H)114cm', 'petrol', '899cc',  '1-3 people',  '2017-05-21', '3', '38', '12', '1', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '2', '39', '6', '2', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Westsail 32', '(L)1650cm x(W)920cm', 'diesel', '73020cc', '5 people', '1983-12-20', '2', '40', '6', '3', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '4', '41', '4', '4', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sailing dinghy', '(L)250cm x (W)150cm', 'N/A', 'N/A', '1', '2019-07-15', '1', '42', '8', '1', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people ', '1981-07-15', '1', '43', '5', '2', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '3', '44', '11', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Princess V50', '(L)1549cm x (W)411cm ', 'Diesel', '5500cc', '4 (1 double berth + 1 twin berth)',  '2016-02-01', '2', '45', '9', '4', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Southern cross 31', '(L)950cm x(W)720cm', 'diesel', '8430cc', '3 people', '1995-04-09', '3', '46', '8', '1', '1');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nonsuch  30', '(L)825cm x(W)920cm', 'diesel', '114000cc', '4 people', '1989-03-31', '2', '47', '2', '2', '4');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('sea doo jetski', '(L)331cm x (W)125cm x (H)114cm',  'petrol', '899cc',  '1-3 people',  '2017-05-21', '2', '48', '1', '3', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Vancouver 32', '(L)4025cm x(W)4020cm', 'diesel', '5230cc', '5 people', '1980-06-12', '3', '49', '1', '4', '2');
insert into boat_details(boat_name,dimensions,fuel_type,engine_size,capacity,mke_date,dock_num,cust_id,staff_id,boat_yard_id,servicing_id) values('Nicholson 32', '(L)830cm x(W)1010cm', 'diesel', '76000cc', '2 people', '1981-07-15', '1', '50', '7', '1', '1');

--Service_Bookings

Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-04-27',  'YES',  1,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-07-10',  'YES',  2, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-05-24',  'YES',  3,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-02-28',  'YES',  4, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-10-24',  'YES',  5,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-01-29',  'YES',  6, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-05-19',  'YES',  7,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-11-28',  'YES',  8,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-04-08',  'YES',  9, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-03-09',  'YES',  10,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-12-16',  'YES',  11,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-01-28',  'YES',  12, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-12-23',  'YES',  13, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-06-06',  'YES',  14,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-03-27',  'YES',  15,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-06-07',  'YES',  16,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-09-02',  'YES',  17, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-11-30',  'YES',  18, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-12-29',  'YES',  19,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-01-07',  'YES',  20,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-04-11',  'YES',  21, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-09-21',  'YES',  22,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-02-11',  'YES',  23,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-02-28',  'YES',  24,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-09-08',  'YES',  25, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-01-26',  'YES',  26,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-05-13',  'YES',  27, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-03-08',  'YES',  28,'NO');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-03-18',  'YES',  29, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-09-19',  'YES',  30, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-05-20', 'NO', 31, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-02-26', 'NO', 32, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-10-25', 'NO', 33, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-08-18', 'NO', 34, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-06-14', 'NO', 35, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-02-22', 'NO', 36, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-03-01', 'NO', 37, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-03-21', 'NO', 38, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-01-30', 'NO', 39, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-09-27', 'NO', 40, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-01-12', 'NO', 41, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-06-14', 'NO', 42, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-10-30', 'NO', 43, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-11-02', 'NO', 44, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-02-19', 'NO', 45, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-08-21', 'NO', 46, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2023-03-18', 'NO', 47, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-11-08', 'NO', 48, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2021-05-29', 'NO', 49, 'YES');
Insert into boat_service(service_date,service_completion,boat_id,pre_booked) values('2022-04-09', 'NO', 50, 'YES');
