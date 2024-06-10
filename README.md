# İndir & Çalıştır

```
    git clone -r https://github.com/rhyrak/scheduler-app
    docker compose up
```

# Program girdileri

Programın çalışması için zorunlu olan girdiler sınıfların listesi ve öğrenci bilgi sisteminden indirebileceğiniz ders bilgileridir. Kalan bölümler opsiyoneldir. Dosya yüklediğinizde tablolar silinir, birden fazla dosya yüklemeniz gerekiyorsa hepsini birleştirerek yükleyin.

## Course/Dersler

Dosya Formatı: Section;Course_Code;Course_Name;Number_of_Students;Course_Environment;T+U;AKTS;Class;Depertmant;Lecturer;Department

Bu bölümde, öğrenci bilgi sisteminden indirdiğiniz verileri yüklemeniz gerekmektedir.

## Classroom/Sınıflar

Dosya Formatı: floor_number;classroom_id;capacity;available_days

Bu bölümde, derslerin yapılacağı sınıfların bilgilerini içeren CSV dosyasını yüklemeniz gerekmektedir. Dosya formatı şu şekildedir:

- floor_number: Sınıfın bulunduğu kat. (-4,-1,0,5, vb.)
- classroom_id: Sınıfın kapı numarası. (C510, B515-516, vb.)
- Kapasite: Sınıfın kaç kişilik olduğu.
- Uygun Günler: Sınıfın uygun olduğu günler, '-' ile ayırılmalı. (Monday-Tuesday, Mondey-Tuesday-Friday, vb.)

## Busy/Meşgul Günler

Dosya Formatı: Lecturer;Busy_Day

Bu bölümde, profesörlerin meşgul oldukları günleri içeren CSV dosyasını yüklemeniz gerekmektedir. Dosya formatı şu şekildedir:

- Profesör Adı: Profesörün tam adı, dersler bölümünde verilen ile aynı olmalı.
- Meşgul Olduğu Gün: Profesörün meşgul olduğu gün (Monday,Tuesday, vb.)

## Conflict/Ek Çakışan Dersler

Dosya Formatı: Department1;Course_Code1;Department2;Course_Code2

Bu bölümde, ek çakışan derslerin bilgilerini içeren CSV dosyasını yüklemeniz gerekmektedir. Dosya formatı şu şekildedir:

- Department1: Birinci dersin departmanı. (CENG, IE, CE, vb.)
- Course_Code1: Birinci dersin kodu. (CENG302, ENGR101, vb.)
- Department2: İkinci dersin departmanı. (CENG, IE, CE, vb.)
- Course_Code2: İkinci dersin kodu. (CENG302, ENGR101, vb.)

Örnek Senaryo: Yazılım mühendisliğinde açılacak SENG123 dersini bilgisayar mühendisliği 3. sınıf öğrencileri de alabilecektir. Bu dersin çakışmaması için eklenebilecek girdi:

```
YAZILIM MÜH.;SENG123;BİLGİSAYAR MÜH.;CENG301
YAZILIM MÜH.;SENG123;BİLGİSAYAR MÜH.;CENG303
YAZILIM MÜH.;SENG123;BİLGİSAYAR MÜH.;CENG305
```

## Split/Dersi Böl

Dosya Formatı: Department;Course_Code;Half_Duration

Bu bölümde, derslerin bölümlerinin sürelerini içeren CSV dosyasını yüklemeniz gerekmektedir. Dosya formatı şu şekildedir:

- Department: Bölünecek dersin departmanı. (CENG, IE, CE, vb.)
- Ders Kodu: Bölünecek dersin kodu. (CENG302, ENGR101, vb.)
- Bölüm Süresi: Dersin her bölümünün süresi (saat cinsinden: 1,2 vb.)

Not: Bölümler uzun olanı önce olacak şekilde farklı günlere yerleştirilir. Örnek: 5 saatlik MATH103 dersini bölmek için `MATH;MATH103;3`. Belirtilen kısıtlama sonucunda salı günü 3 saat perşembe günü 2 saat MATH103 dersi yerleştirilebilir.

## Reserved/Rezerve

Dosya Formatı: Department;Course_Code;Day;Starting_Time

Bu bölümde, belirli dersler için rezerve edilmiş zamanları içeren CSV dosyasını yüklemeniz gerekmektedir. Dosya formatı şu şekildedir:

- Department: Rezerve edilecek dersin departmanı. (CENG, IE, CE, vb.)
- Course_Code: Rezerve edilecek dersin kodu. (CENG302, ENGR101, vb.)
- Day: Dersin yapılacağı gün. (Monday, Tuesday, vb.)
- Starting_Time: Dersin başlayacağı saat. (08:30, 09:30, vb.)
