import '../entity/example_model.dart';

//Örnek Intent Sınıfı. Sayfalar arası veri aktarımında kullanılmalıdır.
class ExampleIntent {
  ExampleModel? example;
  int? id;
  String? title;

  ExampleIntent({this.example, this.id, this.title});
}
