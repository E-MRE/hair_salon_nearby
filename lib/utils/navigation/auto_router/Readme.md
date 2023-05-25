## Auto Router

* Başlangıç olarak:
- AppRouter adında bir class oluşturup @MaterialAutoRouter annotation ile route'ları belirlemek gerekmektedir. Bu class _$AppRouter dan extend olacak şekilde hazırlanmalıdır.
- replaceInRouteName kısmı önemli, buraya göre sayfalar isimlendirilmelidir.
- main.dart dosyasında routeDelegate ve routeInformationParser ataması yapılmalıdır.

* Genel kullanım:
- context.router üzerinden navigasyon işlemlerini kolayca yapılmaktadır. Buradaki en önemli husus sayfaların Stateful olmasıdır. 

* Detaylı Açıklama: https://pub.dev/packages/auto_route

- Örnek Kullanım -

```dart
context.router.navigate(const ExamplePage());
```