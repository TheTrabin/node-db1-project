-- Database Queries

-- Find all customers with postal code 1010
SELECT * FROM Customers WHERE PostalCode = 1010 LIMIT 3;

-- Find the phone number for the supplier with the id 11
SELECT Phone FROM Suppliers WHERE SupplierID = 13;
(04721) 8713

-- List first 10 orders placed, sorted descending by the order date
SELECT * 
FROM Orders 
ORDER BY OrderDate DESC
LIMIT 10;

OrderID	CustomerID	EmployeeID	OrderDate	ShipperID
10443	    66	        8	    1997-02-12	1
10442	    20	        3	    1997-02-11	2
10440   	71	        4	    1997-02-10	2
10441	    55	        3	    1997-02-10	2
10439	    51	        6	    1997-02-07	3
10438	    79	        3	    1997-02-06	2
10436	    7	        3	    1997-02-05	2
10437	    87	        8	    1997-02-05	1
10435	    16	        8	    1997-02-04	2
10433	    60	        3	    1997-02-03	3

-- Find all customers that live in London, Madrid, or Brazil
SELECT *
FROM [Customers]
WHERE City = "London" OR City = "Madrid" OR Country = "Brazil";

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
4	Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
8	Bólido Comidas preparadas	Martín Sommer	C/ Araquil, 67	Madrid	28023	Spain
11	B s Beverages	Victoria Ashworth	Fauntleroy Circus	London	EC2 5NT	UK
15	Comércio Mineiro	Pedro Afonso	Av. dos Lusíadas, 23	São Paulo	05432-043	Brazil
16	Consolidated Holdings	Elizabeth Brown	Berkeley Gardens 12 Brewery	London	WX1 6LT	UK
19	Eastern Connection	Ann Devon	35 King George	London	WX3 6FW	UK
21	Familia Arquibaldo	Aria Cruz	Rua Orós, 92	São Paulo	05442-030	Brazil
22	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	C/ Moralzarzal, 86	Madrid	28034	Spain
31	Gourmet Lanchonetes	André Fonseca	Av. Brasil, 442	Campinas	04876-786	Brazil
34	Hanari Carnes	Mario Pontes	Rua do Paço, 67	Rio de Janeiro	05454-876	Brazil
53	North/South	Simon Crowther	South House 300 Queensbridge	London	SW7 1RZ	UK
61	Que Delícia	Bernardo Batista	Rua da Panificadora, 12	Rio de Janeiro	02389-673	Brazil
62	Queen Cozinha	Lúcia Carvalho	Alameda dos Canàrios, 891	São Paulo	05487-020	Brazil
67	Ricardo Adocicados	Janete Limeira	Av. Copacabana, 267	Rio de Janeiro	02389-890	Brazil
69	Romero y tomillo	Alejandra Camino	Gran Vía, 1	Madrid	28001	Spain
72	Seven Seas Imports	Hari Kumar	90 Wadhurst Rd.	London	OX15 4NB	UK
81	Tradição Hipermercados	Anabela Domingues	Av. Inês de Castro, 414	São Paulo	05634-030	Brazil
88	Wellington Importadora	Paula Parente	Rua do Mercado, 12	Resende	08737-363	Brazil


-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('The Shire','Bilbo Baggins','1 Hobbit-Hole','Bag End','111','Middle Earth');

CustomerID	CustomerName	ContactName	    Address	        City	PostalCode	Country
92	        The Shire	    Bilbo Baggins	1 Hobbit-Hole	Bag End	    111	    Middle Earth

-- Update Bilbo Baggins record so that the postal code changes to "11122"
Update Customers SET PostalCode = "11122" 
Where CustomerID = 92;

CustomerID	CustomerName	ContactName	    Address	        City	 PostalCode	    Country
92	        The Shire	    Bilbo Baggins	1 Hobbit-Hole	Bag End	 11122	        Middle Earth


-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted
Select [City]
FROM [Customers]
GROUP BY [city];

Number of Records: 70 <~ Includes Bilbo Baggins at Bag End for the final count.

The Below is the list of all unique cities.
Select [City], COUNT(Distinct city) AS CountOf 
FROM [Customers]
GROUP BY [city];

City	CountOf
Aachen	1
Albuquerque	1
Anchorage	1
Bag End	1
Barcelona	1
Barquisimeto	1
Bergamo	1
Berlin	1
Bern	1
Boise	1
Brandenburg	1
Bruxelles	1
Bräcke	1
Buenos Aires	1
Butte	1
Campinas	1
Caracas	1
Charleroi	1
Cork	1
Cowes	1
Cunewalde	1
Elgin	1
Eugene	1
Frankfurt a.M.	1
Genève	1
Graz	1
Helsinki	1
I. de Margarita	1
Kirkland	1
Köln	1
København	1
Lander	1
Leipzig	1
Lille	1
Lisboa	1
London	1
Luleå	1
Lyon	1
Madrid	1
Mannheim	1
Marseille	1
Montréal	1
México D.F.	1
München	1
Münster	1
Nantes	1
Oulu	1
Paris	1
Portland	1
Reggio Emilia	1
Reims	1
Resende	1
Rio de Janeiro	1
Salzburg	1
San Cristóbal	1
San Francisco	1
Seattle	1
Sevilla	1
Stavern	1
Strasbourg	1
Stuttgart	1
São Paulo	1
Torino	1
Toulouse	1
Tsawassen	1
Vancouver	1
Versailles	1
Walla	1
Walla Walla	1
Århus	1

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name

SELECT SupplierName  FROM [Suppliers] WHERE LENGTH(SupplierName) = 20 OR LENGTH(SupplierName) > 20;

Number of Records: 12
SupplierName
New Orleans Cajun Delights
Grandma Kelly s Homestead
Cooperativa de Quesos 'Las Cabras'
Specialty Biscuits, Ltd.
Refrescos Americanas LTDA
Heli Süßwaren GmbH & Co. KG
Plutzer Lebensmittelgroßmärkte AG
Nord-Ost-Fisch Handelsgesellschaft mbH
Formaggi Fortini s.r.l.
Aux joyeux ecclésiastiques
New England Seafood Cannery
Pasta Buttini s.r.l.