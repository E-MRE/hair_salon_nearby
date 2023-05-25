import 'package:better_open_file/better_open_file.dart';

///Herhangi bir dizinde kayıtlı olmayan dosyaları geçici bellekte oluşturup
///Cihazın kullandığı uygulamalar ile açmayı sağlar.
abstract class OpenTemporaryFile {
  Future<OpenResult> openFile({
    required String fileName,
    required String fileExtension,
    required String base64,
  });
}
