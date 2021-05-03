

    CREATE TABLE hastaneler
    (
        id CHAR(4),
        isim VARCHAR2(50),
        sehir VARCHAR2(30),
        ozel CHAR(1),
        CONSTRAINT pk_id PRIMARY KEY(id)
    );
    
    INSERT INTO hastaneler VALUES('H101','ACI MADEM HASTANESI','ISTANBUL','Y');
    INSERT INTO hastaneler VALUES('H102','HASZEKI HASTANESI','ISTANBUL','N');
    INSERT INTO hastaneler VALUES('H103','MEDIKOL HASTANESI','IZMIR','Y');
    INSERT INTO hastaneler VALUES('H104','NEMORYIL HASTANESI','ANKARA','Y');
    
    
    SELECT * FROM hastaneler;
    
    
    CREATE TABLE hastalar
    (
        kimlik_no CHAR(12),
        isim VARCHAR2(30),
        teshis VARCHAR2(30),
        CONSTRAINT pk_kimlik PRIMARY KEY(kimlik_no)
    );
    
    INSERT INTO hastalar VALUES('12345678901','Ali Can','Gizli Seker');
    INSERT INTO hastalar VALUES('45678901121','Ayse Yilmaz','Hipertansiyon');
    INSERT INTO hastalar VALUES('78901123451','Steve Jobs','Pankreatit');
    INSERT INTO hastalar VALUES('12344321251','Tom Hanks','COVID19');
    
    SELECT * FROM hastalar;
    
    
    CREATE TABLE bolumler
    (
        bolum_id CHAR(5),
        bolum_adi VARCHAR2(30),
        CONSTRAINT pk_bolum_adi PRIMARY KEY(bolum_adi)
    );
    
     INSERT INTO bolumler VALUES('DHL','Dahiliye');
     INSERT INTO bolumler VALUES('KBB','Kulak-Burun_Bogaz');
     INSERT INTO bolumler VALUES('NRJ','Noroloji');
     INSERT INTO bolumler VALUES('GAST','Gastroloji');
     INSERT INTO bolumler VALUES('KARD','Kardioloji');
     INSERT INTO bolumler VALUES('PSK','Psikiyatri');
     INSERT INTO bolumler VALUES('GOZ','Goz Hastaliklari');
     
     SELECT * FROM bolumler;
     
     
    CREATE TABLE hasta_kayitlari
    (
        kimlik_no CHAR(12),
        hast_isim VARCHAR2(30),
        hastane_adi VARCHAR2(50),
        bolum_adi VARCHAR2(30),
        teshis VARCHAR2(30),
        CONSTRAINT pk_kimlik_no PRIMARY KEY(kimlik_no)
    );
    
    INSERT INTO hasta_kayitlari VALUES('1111','NONAME','','','');
    INSERT INTO hasta_kayitlari VALUES('2222','NONAME','','','');
    INSERT INTO hasta_kayitlari VALUES('3333','NONAME','','','');
    
    SELECT * FROM hasta_kayitlari;
    
/*==========================================================*/
    
    UPDATE hasta_kayitlari
    SET hast_isim = 'Salvadore Dali',
        hastane_adi = 'John Hopins',
        bolum_adi = 'Noroloji',
        teshis = 'Parkinson',
        kimlik_no = '99991111222'
    WHERE kimlik_no = '3333';
    
/*==========================================================*/
    
    UPDATE hasta_kayitlari
    SET hast_isim = 'Ali Can',
        hastane_adi = (SELECT isim FROM hastaneler
                       WHERE id = 'H104'),
                       
        bolum_adi = (SELECT bolum_adi FROM bolumler
                     WHERE bolum_id = 'DHL'),
                     
        teshis = (SELECT teshis FROM hastalar
                  WHERE isim = 'Ali Can'),
                  
        kimlik_no = (SELECT kimlik_no FROM hastalar
                     WHERE isim = 'Ali Can')
                     
    WHERE kimlik_no = '1111';
     
    SELECT * FROM hasta_kayitlari;
    
/*==========================================================*/
    
    UPDATE hasta_kayitlari
    SET hast_isim = (SELECT isim FROM hastalar
                     WHERE isim = 'Ayse Yilmaz'),
                     
        hastane_adi = (SELECT isim FROM hastaneler
                       WHERE id = 'H103'),
                       
        bolum_adi = (SELECT bolum_adi FROM bolumler
                     WHERE bolum_id = 'KBB'),
                     
        teshis = (SELECT teshis FROM hastalar
                  WHERE isim = 'Tom Hanks'),
                  
        kimlik_no = (SELECT kimlik_no FROM hastalar
                     WHERE isim = 'Steve Jobs')
                     
    WHERE kimlik_no = '2222';
    
    SELECT * FROM hasta_kayitlari;
    
    
    
    
    
    
    