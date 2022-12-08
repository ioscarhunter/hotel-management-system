import 'package:hotel_management_system/service/file_reader_service.dart';

class FileRepository {
  FileRepository(this.fileReaderService);

  final FileReaderService fileReaderService;

  Future<List<List<String>>> readAsLines(Uri uri) async {
    final List<String> lines = await fileReaderService.readFile(uri);
    return lines.map((line) => line.split(' ')).toList();
  }
}
