

/*=================================DELETE================================*/

--DELETE FROM tablo_ad?; tablonun tum icerigini siler.
--Bu bir DML komutudur.

    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
    
    DROP TABLE ogrenciler;
    
    SELECT * FROM ogrenciler;
    
    --id'si 124 olan ogrenciyi sil
    DELETE FROM ogrenciler
    WHERE id = 124;
    
    --ad? Kemal Yasa olan kayd? silelim
    DELETE FROM ogrenciler
    WHERE isim = 'Kemal Yasa';
    
    -- ad? Nesibe Y?lmaz ve Mustafa Bak olan kay?tlar? silelim
    DELETE FROM ogrenciler
    WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak';
 
    DELETE FROM ogrenciler
    WHERE isim = 'Ali Can' AND id = 123;
    
    --id'si 126'dan buyuk olanlar? sil
    DELETE FROM ogrenciler
    WHERE id > 126;
    
    --id'si 123,125,126 olanlari sil
    DELETE FROM ogrenciler
    WHERE id IN (123,125,126);
    
    --tablodaki tum sat?rlar? silin
    DELETE FROM ogrenciler; --tum kay?tlar? siler ama tabloyu silmez
    
    ROLLBACK ; --delete ile silinen verileri getirir
    
    DROP TABLE ogrenciler; --tabloyu siler ve veritaban?n?n copune gonderir.
    
    FLASHBACK TABLE ogrenciler TO BEFORE DROP;--COP KUTUSUNDA olan kutuyu geri geitir.
    
    DROP TABLE ogrenciler PURGE; -- tabloyu cop kutusuna atmaks?z?n siler
    
    SELECT * FROM ogrenciler;
    
    
    /*=================================TRUNCATE=======================*/
    
    --DELETE gibi tüm verileri siler. Secmeli silme yapamaz (DDL)
    --TRUNCATE ile silinen verilerin geri al?nmas? daha zordur. Ancak
    --Transaction yontemi ile geri al?nmas? mumkun olabilir.
    
    TRUNCATE TABLE ogrenciler;--Tum verileri hassas sekilde siler(DDL)
    
    SELECT * FROM ogrenciler;


    /*=============================================================*/
                    --ILISKILI TABLOLARDA S?LME--
    /*=============================================================*/

    CREATE TABLE talebeler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);


    CREATE TABLE notlar 
    (
        talebe_id char(3), 
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE
    );
    
    
    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('124', 'fizik',75);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    
    -------------------ONCE CHILD'DAN
    DELETE FROM notlar
    WHERE talebe_id = 124;
    
    DELETE FROM talebeler
    WHERE id = 124;
    -------------------SONRA PARENT'TAN
    
    --ON DELETE CASCADE'DEN SONRA parent'daki kay?t silinince
    --tum iliskili kay?tlar? siler. child'dan silinirse zaten sadece
    --child'den siler
    
    DELETE FROM talebeler
    WHERE id = 124;
    
    
    SELECT * FROM talebeler;
    SELECT * FROM notlar;
    
    DROP TABLE notlar;
    DROP TABLE talebeler;
    