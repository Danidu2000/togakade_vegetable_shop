import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/vegetable.dart';

class InventoryRepository {
  final String _fileName = 'inventory.json';

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  Future<List<Vegetable>> loadInventory() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return [];
      final data = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(data);
      return jsonList.map((json) => Vegetable.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load inventory: $e');
    }
  }

  Future<void> saveInventory(List<Vegetable> inventory) async {
    try {
      final file = await _getFile();
      final jsonList = inventory.map((veg) => veg.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList));
    } catch (e) {
      throw Exception('Failed to save inventory: $e');
    }
  }
}
