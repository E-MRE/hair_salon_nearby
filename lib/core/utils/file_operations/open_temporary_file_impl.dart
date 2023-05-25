import 'package:better_open_file/better_open_file.dart';

import '../../adapters/abstract/file_service.dart';
import '../../adapters/abstract/open_file_service.dart';
import 'open_temporay_file.dart';

class OpenTemporaryFileImpl implements OpenTemporaryFile {
  final FileOperationsService fileService;
  final OpenFileService openFileService;

  OpenTemporaryFileImpl({
    required this.fileService,
    required this.openFileService,
  });

  @override
  Future<OpenResult> openFile({
    required String fileName,
    required String fileExtension,
    required String base64,
  }) async {
    try {
      var tempFile = await fileService.createFile(
        fileName: fileName,
        fileExtension: fileExtension,
        base64: base64,
      );

      return openFileService.open(tempFile.path);
    } catch (error) {
      return OpenResult(message: error.toString(), type: ResultType.error);
    }
  }
}
