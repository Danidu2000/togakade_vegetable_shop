import '../models/vegetable.dart';
import '../repositories/inventory_repository.dart';

class ThogaKadeManager {
  final InventoryRepository _repository = InventoryRepository();

  Future<List<Vegetable>> getInventory() => _repository.loadInventory();

  Future<void> addVegetable(Vegetable vegetable) async {
    final inventory = await _repository.loadInventory();
    inventory.add(vegetable);
    await _repository.saveInventory(inventory);
  }
}
