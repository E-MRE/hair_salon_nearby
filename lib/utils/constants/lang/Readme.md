## Yerelleştirme Kullanımı

- Yerelleştirme için ekranda gösterilen text'ler assets/translations/ içerisinde bulunan json dosyaları içerisine key, value şeklinde eklenmelidir.

- Varsayılan olarak tr-TR ve en-En bulunmaktadır.

- Oradaki örnekler gibi oluşturulabilir.

- Ardından aşağıdaki komut çalıştırmalıdır. Bu sayede keylerimizi otomatik olarak oluşturabiliriz.

```dart
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!       Generate localization keys auto      !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
flutter pub run easy_localization:generate -S assets/translations -f keys -O lib/utils/constants -o locale_keys.g.dart
```


- Oluşturduktan sonra kullanmak istediğimiz yerde 
```dart 
LocaleKeys.title.tr(); // title bizim key'imiz oluyor. // .tr() ise seçili dile göre ekranda text gösteriyor.
```