## Navigation

- Sayfalar arası geçiş yapmak için kullanılır.
- Default olarak onGenerateRoute seçilmiştir.


# onGenerateRoute Kullanımı

* Başlangıç olarak:
- main.dart dosyasında onGenerateRoute ve navigatorKey ataması yapılmalıdır.
- NavigationManager ve NavigationRouteManager provider ile sarmallanmalıdır.

* Genel kullanım:
- İlk Olarak NavigationPages'a enum olarak sayfamız eklenir.
- Sonrasında NavigationRouteManager içerisinde generateRoute'ta bulunan switch case yapısına oluşturduğumuz enum, case olarak eklenir.
- Eğer parametre varsa argument ile ilgili sayfaya aktarılır.

- Örnek Kullanım -

```dart
context.read<NavigationService>().navigatetoPage(page: NavigationPage.menu, data: 'Test');
```

# AutoRoute Kullanımı

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