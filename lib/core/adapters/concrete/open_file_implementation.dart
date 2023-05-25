import 'package:better_open_file/better_open_file.dart';

import '../abstract/open_file_service.dart';

class OpenFileImplementation implements OpenFileService {
  @override
  Future<OpenResult> open(
    String filePath, {
    String? type,
    String? uti,
    String linuxDesktopName = 'xdg',
    bool linuxProcess = false,
  }) async {
    return await OpenFile.open(
      filePath,
      type: type,
      uti: uti,
      linuxDesktopName: linuxDesktopName,
      linuxByProcess: linuxProcess,
    );
  }
}
