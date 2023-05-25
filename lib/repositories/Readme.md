# Repositories

- Burada veriye erişim için hangi yöntemi kullanacağımızı belirliyoruz.
- API'den Http, Dio, vb. yöntemler ile veya Firebase, Lokalden mi getireceğiz tarafını burada hallediyoruz.

## Kullanım

- Öncelikle repository ismine karar verelim. Bu repository hangi metotları içeriyor bunları belirleyelim. <br/>
- `abstract` içerisine soyut sınıfımızı oluşturuyoruz. operasyon_adi_repository.dart şeklinde... <br/>
- `concrete` içerisine somut sınıfımızı ekleyelim ve implement edelim. İsimlendirme için hangi yöntemi kullanıyorsak
  ön ekini eklemeyi unutmayalım. Http için: http_login_repository.dart  Firebase için: firebase_login_repository.dart