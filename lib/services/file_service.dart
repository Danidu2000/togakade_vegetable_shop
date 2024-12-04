import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<File> _getFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fileName');
  }

  Future<void> writeToFile(String fileName, dynamic data) async {
    final file = await _getFile(fileName);
    await file.writeAsString(jsonEncode(data));
  }

  Future<dynamic> readFromFile(String fileName) async {
    final file = await _getFile(fileName);
    if (!await file.exists()) return null;
    final contents = await file.readAsString();
    return jsonDecode(contents);
  }
}
