--TABLO OLUSTURMA
/*
  ikinci yontem
*/
CREATE TABLE student
(
    std_id CHAR(3),
    std_name VARCHAR2(20),
    std_age NUMBER
);

INSERT INTO student VALUES('101', 'AHMET CAN', 30);
INSERT INTO student VALUES('102', 'MUSTAFA AL?', 20);
INSERT INTO student VALUES('103', 'AY?E YILMAZ', 18);
INSERT INTO student VALUES('104', 'MEL?H GÖR', 40);
INSERT INTO student VALUES('106', 'VEL? BAK', '');

--parçal? veri giri?i
INSERT INTO student(std_id,std_name) VALUES('105','JOHN TRAVOLTA');

SELECT * FROM student;  


DROP TABLE student;

CREATE TABLE urunler
(
    urun_id NUMBER,
    urun_adi VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)
);

INSERT INTO urunler VALUES(100, 'C?PS', 5.50, '22-APR-22', 500);
INSERT INTO urunler VALUES(101, 'KOLA', 7.50, '22-APR-23', 300);
INSERT INTO urunler VALUES(102, 'AYRAN', 3.50, '22-APR-24', 450);
INSERT INTO urunler VALUES(103, 'B?SKÜV?', 2.40, '22-APR-22', 1500);

SELECT * FROM urunler;

DROP TABLE urunler;    