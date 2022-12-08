import 'dart:io';

class FileReaderService {
  Future<List<String>> readFile(Uri uri) async {
    final File file = File.fromUri(uri);
    return file.readAsLines();
  }
}
