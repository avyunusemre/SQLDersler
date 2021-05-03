    CREATE TABLE calisanlar
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13-APR-2018');
    INSERT INTO calisanlar VALUES('10002', 'Mehmet Y?lmaz', 12000, '14-APR-2018');
    INSERT INTO calisanlar VALUES('10003', '', 7000, '13-APR-2018');
    INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-APR-2018');
    INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 7000, '14-APR-2018');
    INSERT INTO calisanlar VALUES('10006', 'Canan Yas', NULL, '14-APR-2018');
    
    SELECT * FROM calisanlar;
    
    DROP TABLE calisanlar;
    
    DELETE calisanlar
    WHERE id = '10001';
    
    ---------------------------------
    --Alternatif Primary Key yontemi
     CREATE TABLE calisanlar
    (
        id CHAR(5),
        isim VARCHAR2(50) UNIQUE,
        maas NUMBER(5) NOT NULL,
        ise_baslama DATE,
        CONSTRAINT id_pk PRIMARY KEY(id) -- DISABLE ile bu ozelligi kapatabiliriz.
    );
    
    INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan', 7000, '13-APR-2018');
    INSERT INTO calisanlar VALUES('10002', 'Mehmet Y?lmaz', 12000, '14-APR-2018');
    INSERT INTO calisanlar VALUES('10003', 'Can Yaman', 7000, '13-APR-2018');
    
    SELECT * FROM calisanlar;
    
    
    
    CREATE TABLE adresler
    (
        adres_id CHAR(5), --REFERENCES calisanlar(id), --==> basit yontem
        sokak VARCHAR(50),
        cadde VARCHAR(30),
        sehir VARCHAR(15),
        CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar (id)
    );
    
    INSERT INTO adresler VALUES('10001', 'Mutlu Sk' , '40. Cad.', 'IST');
    INSERT INTO adresler VALUES('10001', 'Can Sk' , '50. Cad.', 'Ankara');
    INSERT INTO adresler VALUES('10003', 'Aga Sk' , '30. Cad.', 'Antep');
    INSERT INTO adresler VALUES('', 'Aga Sk' , '30. Cad.', 'Antep');
    
    --INSERT INTO adresler VALUES('10004', 'Gel Sk', '20. Cad', 'Erzurum'); 
    --hata verir. cunku parent table'da 10004 diye bir id yok.
    
    SELECT * FROM adresler;
    SELECT * FROM calisanlar;
    
    DROP TABLE adresler;
    DROP TABLE calisanlar;
    
    --once child table'i silmek gerekir. Parent child ondan sonra 
    --ancak silinebilir.
    
    SELECT * FROM calisanlar, adresler
    WHERE id = '10001' AND adres_id = '10001';
    
    CREATE TABLE sehirler
    (
        alan_kodu NUMBER(3) DEFAULT 34,
        isim VARCHAR(20) DEFAULT 'ISTANBUL',
        nüfus NUMBER(8) CHECK (nüfus>0)
    );
    --Check'ten sonra Default keywordy kullan?lamaz
    
    INSERT INTO sehirler VALUES(54, 'Sakarya', 1250000);
    INSERT INTO sehirler VALUES(25, 'Erzurum', 1150000);
    
    INSERT INTO sehirler (nüfus) VALUES(5000000); 
    --INSERT INTO sehirler (nüfus) VALUES(-2000000); ==> hata verir. Cunku Check ile sart koymustuk
    
    SELECT * FROM sehirler;
    
    DROP TABLE sehirler;
    
    
    
    
    
    
    
    
    
    
    
    