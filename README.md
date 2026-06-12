# matlab-pid-drone
IHA irtifa kontrolu - PID simulasyonu (Matlab)

Matlab ile gelistirilmis insansiz hava araci (IHA) irtifa kontrol simulasyonu.
PID kontrolor algoritmasinin adim yaniti analizi yapilmistir.

## Proje Hakkinda

Bu proje, bir IHA'nin hedef irtifaya guvenli sekilde ulasmasini saglayan
PID (Proportional-Integral-Derivative) kontrolor tasarimini ve performans
analizini icerir. Baykar TEKNOFEST surecinde gelistirilen IHA sistemlerine
yonelik kontrol algoritmasi calismasidir.

## Sistem Parametreleri

| Parametre | Deger | Aciklama |
|-----------|-------|----------|
| Kp | 1.5 | Orantısal kazanc |
| Ki | 0.2 | Integral kazanc |
| Kd | 2.0 | Turevsel kazanc |
| Hedef irtifa | 10 m | Referans giris |
| Simulasyon suresi | 10 s | Toplam sure |

## Performans Sonuclari

| Metrik | Deger |
|--------|-------|
| Asim | %9.13 |
| Oturma suresi | 0.95s |

## Gorseller

### Optimize edilmis PID yaniti
![PID Step Response](pid_optimized.png)

### Parametre karsilastirmasi
![PID Comparison](pid_initial.png)

## Teknolojiler
- Matlab (Online)
- PID kontrol teorisi
- IHA dinamik modelleme

## Yazar
Esra — Sakarya Universitesi, Bilgisayar Muhendisligi & Elektrik-Elektronik Muhendisligi
