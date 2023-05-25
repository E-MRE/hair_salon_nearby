import 'dart:io';

///Dosyalarla çalışmak için kullanılan servistir.
///`pub.dev` de bulunan `path_provider` paketiyle dosya işlemleri yapılmaktadır.
abstract class FileOperationsService {
  ///Dosya dizinidir.
  Future<String> get path;

  ///Yeni bir dosya oluşturmak için kullanılır.
  Future<File> createFile({
    required String fileName,
    required String fileExtension,
    required String base64,
  });

  ///Dosya silmek için kullanılır
  void deleteFile(File file);
}
