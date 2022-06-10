/*DDL KOMUTLARI */

/*Tablo oluþturma*/
Create TABLE tbl_Products(
	P_ID int IDENTITY(1,1) NOT NULL,
	P_Name varchar(50),
	P_Image varchar(max),
	P_Category varchar(50),
	P_Desc varchar(200),
	P_Price decimal(8,2),
	C_ID int
	PRIMARY KEY(P_ID)
);
/*Tablo oluþturma*/
Create TABLE tbl_Category(
	C_ID int IDENTITY(1,1) NOT NULL,
	C_Name varchar(50),
	P_ID int,  /*product tablosu ile eþitleme de kullanýlabilir*/
	PRIMARY KEY(C_ID)
);

ALTER TABLE tbl_Products
Add P_Type varchar(20) /*Belirtilen tabloya belirtilen kolonu ekler*/

Alter TABLE tbl_Products
Drop Column P_Type; /*Belirtilen tablodaki belirtilen kolonu tablodan siler*/

/*Truncate komutu ile tablolarýn içindeki datalarý temizleriz*/
TRUNCATE TABLE tbl_Products  
TRUNCATE TABLE tbl_Category

DROP TABLE tbl_Category; /*Belirtilen tabloyu tamamen siler*/


/*DML Komutlarý*/

/*Veritabanýnda ilgili tabloya veri giriþi için kullanýlýr*/
insert into tbl_Products (P_Name,P_Image,P_Category,P_Desc)values ('Ürün','ürün.png','Kategori','Ürün Açýklamasý');
/*Veritabanýnda ilgili tablodaki verileri verilen koþullara göre çekmeyi saðlar*/
select P_ID,P_Name,P_Desc from tbl_Products where P_ID=5
select *from tbl_Category

/*Veritabanýnda ilgili tablodaki belirtilen sütundaki verileri deðiþtirmek için kullanýlýr*/
update tbl_Products set Product_Category='Spor' where Product_ID=8
/*Veritabanýnda ilgili tablodaki belirtilen sütunu silmek için kullanýlýr. */
DELETE FROM tbl_Products WHERE P_ID=1;

/*DML Komutlarý Detaylý Örnekler*/
Select *from tbl_Products Where P_Category='Yemek' AND P_ID=1
SELECT * FROM tbl_Products WHERE NOT P_Category='Germany';
Select *from tbl_Products WHERE P_Category='Yemek' OR P_Category='Ýnþaat Malzemesi'
select P_Category from tbl_Products where P_ID=7 Group By P_Category

SELECT MAX(P_Price) as MaxPrice FROM tbl_Products
SELECT MIN(P_Price) as MinPrice FROM tbl_Products
SELECT COUNT(P_ID)FROM tbl_Products WHERE P_Category='Ýnþaat';
SELECT AVG(P_Price)FROM tbl_Products WHERE P_Category='Yemek';
SELECT SUM(P_Price)FROM tbl_Products

select p.C_ID,p.P_Category from tbl_Products as p INNER JOIN tbl_Category as c ON p.C_ID= c.C_ID;

SELECT * FROM tbl_Products WHERE P_Name LIKE 'a%'
SELECT * FROM tbl_Products WHERE P_Name LIKE '%yem%'
SELECT * FROM tbl_Products WHERE P_Name LIKE '__m%'
/*Toplu where koþulu için*/
SELECT * FROM tbl_Products WHERE P_Name IN ('Yemek', 'Ýnþaat', 'Kýrtasiye');
SELECT * FROM tbl_Products WHERE P_Name NOT IN ('Yemek', 'Ýnþaat', 'Kýrtasiye');