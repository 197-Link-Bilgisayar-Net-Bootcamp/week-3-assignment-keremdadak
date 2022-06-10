/*DDL KOMUTLARI */

/*Tablo olu�turma*/
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
/*Tablo olu�turma*/
Create TABLE tbl_Category(
	C_ID int IDENTITY(1,1) NOT NULL,
	C_Name varchar(50),
	P_ID int,  /*product tablosu ile e�itleme de kullan�labilir*/
	PRIMARY KEY(C_ID)
);

ALTER TABLE tbl_Products
Add P_Type varchar(20) /*Belirtilen tabloya belirtilen kolonu ekler*/

Alter TABLE tbl_Products
Drop Column P_Type; /*Belirtilen tablodaki belirtilen kolonu tablodan siler*/

/*Truncate komutu ile tablolar�n i�indeki datalar� temizleriz*/
TRUNCATE TABLE tbl_Products  
TRUNCATE TABLE tbl_Category

DROP TABLE tbl_Category; /*Belirtilen tabloyu tamamen siler*/


/*DML Komutlar�*/

/*Veritaban�nda ilgili tabloya veri giri�i i�in kullan�l�r*/
insert into tbl_Products (P_Name,P_Image,P_Category,P_Desc)values ('�r�n','�r�n.png','Kategori','�r�n A��klamas�');
/*Veritaban�nda ilgili tablodaki verileri verilen ko�ullara g�re �ekmeyi sa�lar*/
select P_ID,P_Name,P_Desc from tbl_Products where P_ID=5
select *from tbl_Category

/*Veritaban�nda ilgili tablodaki belirtilen s�tundaki verileri de�i�tirmek i�in kullan�l�r*/
update tbl_Products set Product_Category='Spor' where Product_ID=8
/*Veritaban�nda ilgili tablodaki belirtilen s�tunu silmek i�in kullan�l�r. */
DELETE FROM tbl_Products WHERE P_ID=1;

/*DML Komutlar� Detayl� �rnekler*/
Select *from tbl_Products Where P_Category='Yemek' AND P_ID=1
SELECT * FROM tbl_Products WHERE NOT P_Category='Germany';
Select *from tbl_Products WHERE P_Category='Yemek' OR P_Category='�n�aat Malzemesi'
select P_Category from tbl_Products where P_ID=7 Group By P_Category

SELECT MAX(P_Price) as MaxPrice FROM tbl_Products
SELECT MIN(P_Price) as MinPrice FROM tbl_Products
SELECT COUNT(P_ID)FROM tbl_Products WHERE P_Category='�n�aat';
SELECT AVG(P_Price)FROM tbl_Products WHERE P_Category='Yemek';
SELECT SUM(P_Price)FROM tbl_Products

select p.C_ID,p.P_Category from tbl_Products as p INNER JOIN tbl_Category as c ON p.C_ID= c.C_ID;

SELECT * FROM tbl_Products WHERE P_Name LIKE 'a%'
SELECT * FROM tbl_Products WHERE P_Name LIKE '%yem%'
SELECT * FROM tbl_Products WHERE P_Name LIKE '__m%'
/*Toplu where ko�ulu i�in*/
SELECT * FROM tbl_Products WHERE P_Name IN ('Yemek', '�n�aat', 'K�rtasiye');
SELECT * FROM tbl_Products WHERE P_Name NOT IN ('Yemek', '�n�aat', 'K�rtasiye');