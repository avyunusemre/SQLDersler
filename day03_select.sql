
    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara', 75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara', 85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul', 82);
    
    SELECT * FROM ogrenciler;
    
    --Notu 80'den buyuk olanlar
    SELECT * FROM ogrenciler
    WHERE sinav_notu > 80; 
    
    --Notu 80'den buyuk olanlar? isim ve notu
    SELECT isim, sinav_notu 
    FROM ogrenciler
    WHERE sinav_notu > 80;
    
    --Adresi Ankara olanlar?
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
    DROP TABLE ogrenciler;
    
    
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );
    
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Y?lmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ay?e Can', 4000);
    
    SELECT * FROM personel;
    
    --id 10002 ile 10005 aras?nda olan personlein tum bilgileri
    SELECT * FROM personel
    WHERE id >= '10002' AND id <= '10005';
    
    /*===================BETWEEN=====================*/
    SELECT id, isim FROM personel
    WHERE id BETWEEN '10002' AND '10005'; --ALT VE UST LIMITLER DAHIL
    
    SELECT * FROM personel
    WHERE isim BETWEEN 'Mehmet Y?lmaz' AND 'Veli Han';
    --asl?nda m ile v harfi aras?ndakileri gosteriyor. Bu nedenle Mustafa Ali de 
    --query sonucunda gorunur
    
    --id'si 10002 ile 10004 aras?nda olmayanlar
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
    /*===================IN=====================*/
    
    -- id'si 10001, 10002 ve 100004 olanlar? listele
    SELECT * FROM personel
    WHERE id = '10001' OR id = '10002' OR id = '10004'; 
    
    SELECT * FROM personel
    WHERE id IN ('10001','10002','10004');
    
    --Maas? 7000 ile 12000 olan personel
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
    /*===================LIKE=====================*/
    --ismi M harfi ile baslayanlar? goster
    SELECT * FROM personel
    WHERE isim LIKE 'M%';
    
    --ismi 7 harfli olanlar? goster
    SELECT * FROM personel
    WHERE isim LIKE '_______';
    
    --2. harfi e olanlar? listele
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
    
    --Maas?n?n son iki hanesi 00 olanlar? listele
    SELECT * FROM personel
    WHERE maas LIKE '%00';
    
    --1. harfi A ve 7. harfi A olan personeli bulunuz
    SELECT * FROM personel
    WHERE isim LIKE 'A_____A%';
    
    --isminde an kelimesi gecen personeller
    SELECT * FROM personel
    WHERE isim LIKE '%an%';
    
    --maas? 4 basamakl? olmayanlar? goster
    SELECT * FROM personel
    WHERE maas NOT LIKE '____';
    
    /* ===================SELECT - REGEXP-LIKE=================
    
    Syntax:
    -------
    REGEXP_LIKE(sutun_ad?, 'pattern[] ', 'c'])
    
    ===========================================================*/
    
    
    
     CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'h0t', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    DROP TABLE kelimeler;
    
    --içerisinde hi gecen kelimeleri sorgulay?n
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    --icerisinde herhangi bir yerde h veya i gecen kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --icerisinde ot veya at harfleri olan kelimeleri sorgulay?n
    -- veya islemi | karakteri ile yap?l?r
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i'); -- i case insensitive demektir.
                                            --'c' case sensitive demek fakat default deger oldugu icin yaz?lmas? gerekmez
                                            
    --hi veya ho ile baslayan kelimeleri sorulay?n
    --baslama icin ^ karakteri kullan?l?r
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho', 'i');    
    
    --t ile veya m ile biten kelimeleri listeleyiniz
    --bitis icin $ isareti kullan?l?r
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    
    
    --h ile baslay?p t ile biten 3 harfli kelimeleri s?ralay?n
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[a-z0-9]t', 'i');
    -- -(tire) karakteri aral?k belirtir 
    -- [] tek bir karakter gosterir
    
    --ilk harfi h, son harfi t olup 2. harfi a veya i olan 
    --kelimeleri s?ralay?n
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'h[ai]t','i');
    
    --icinde m veya i veya e olan kelimeleri s?ralay?n
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'[mie](*)', 'i'); 
    --(*) bundan sonra ne olursa olsun demektir. bu soru icin kullan?lmas? zorunlu degildir.
    
    --icerisinde en az 2 tane o harfi olan kelimeleri s?ralay?n?z.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'o{2}');
    
    
     
    
    
    