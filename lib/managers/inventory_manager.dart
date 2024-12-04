import '../models/vegetable.dart';
import '../repositories/inventory_repository.dart';

class InventoryManager {
  final InventoryRepository _repository = InventoryRepository();

  /// Fetches the einventory from the repository.
  Future<List<Vegetable>> getInventory() async {
    try {
      return await _repository.loadInventory();
    } catch (e) {
      throw Exception('Failed to fetch inventory: $e');
    }
  }

  /// Adds a new vegetable to the inventory.
  Future<void> addVegetable(Vegetable vegetable) async {
    try {
      final inventory = await _repository.loadInventory();
      inventory.add(vegetable);
      await _repository.saveInventory(inventory);
    } catch (e) {
      throw Exception('Failed to add vegetable: $e');
    }
  }

  /// Removes a vegetable from the inventory by its ID.
  Future<void> removeVegetable(String id) async {
    try {
      final inventory = await _repository.loadInventory();
      inventory.removeWhere((veg) => veg.id == id);
      await _repository.saveInventory(inventory);
    } catch (e) {
      throw Exception('Failed to remove vegetable: $e');
    }
  }

  /// Updates the stock quantity of a vegetable by its ID.
  Future<void> updateStock(String id, double quantity) async {
    try {
      final inventory = await _repository.loadInventory();
      final vegetable = inventory.firstWhere((veg) => veg.id == id, orElse: () => throw Exception('Vegetable not found'));
      vegetable.availableQuantity = quantity;
      await _repository.saveInventory(inventory);
    } catch (e) {
      throw Exception('Failed to update stock: $e');
    }
  }

  /// Retrieves a specific vegetable by its ID.
  Future<Vegetable> getVegetableById(String id) async {
    try {
      final inventory = await _repository.loadInventory();
      return inventory.firstWhere(
            (veg) => veg.id == id,
        orElse: () => throw Exception('Vegetable not found'),
      );
    } catch (e) {
      throw Exception('Failed to fetch vegetable by ID: $e');
    }
  }



  /// Generates a low-stock alert for vegetables below a specified threshold.
  Future<List<Vegetable>> getLowStockVegetables(double threshold) async {
    try {
      final inventory = await _repository.loadInventory();
      return inventory.where((veg) => veg.availableQuantity < threshold).toList();
    } catch (e) {
      throw Exception('Failed to fetch low-stock vegetables: $e');
    }
  }
}
