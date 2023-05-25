import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../abstract/file_service.dart';

class TemporaryFileManager implements FileOperationsService {
  @override
  Future<String> get path async {
    var directory = await getTemporaryDirectory();

    return directory.path;
  }

  @override
  Future<File> createFile({
    required String fileName,
    required String fileExtension,
    required String base64,
  }) async {
    File tempFile = File('${await path}/$fileName.$fileExtension');
    var bytes = base64Decode(base64);
    return await tempFile.writeAsBytes(bytes);
  }

  @override
  void deleteFile(File file) {
    file.delete();
  }
}
