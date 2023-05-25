import 'package:better_open_file/better_open_file.dart';

///`pub.dev` de bulunan `open_file` paketini adapte eden servistir.
///Paketi yönetmek, defansif kod yazmak ve test edilebilirliği sağlamak adına oluşturulmuştur.
abstract class OpenFileService {
  ///Belirtilen dizindeki dosyayı açmak için kullanılır.
  ///İşlem sonunda `[OpenResult]` döndürerek işlem hakkında bilgi verilir.
  Future<OpenResult> open(
    String filePath, {
    String? type,
    String? uti,
    String linuxDesktopName = 'xdg',
    bool linuxProcess = false,
  });
}
