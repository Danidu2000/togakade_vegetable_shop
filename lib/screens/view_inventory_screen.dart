import 'package:flutter/material.dart';
import '../managers/inventory_manager.dart';
import '../models/vegetable.dart';

class ViewInventoryScreen extends StatelessWidget {
  const ViewInventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = InventoryManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('View Inventory'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Vegetable>>(
        future: manager.getInventory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final inventory = snapshot.data ?? [];
          if (inventory.isEmpty) {
            return const Center(
              child: Text(
                'No vegetables available in inventory.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: inventory.length,
            itemBuilder: (context, index) {
              final vegetable = inventory[index];
              return Card(
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.local_florist, color: Colors.green),
                  title: Text(vegetable.name),
                  subtitle: Text(
                    'Price: \$${vegetable.pricePerKg.toStringAsFixed(2)} /kg\nStock: ${vegetable.availableQuantity} kg\nCategory: ${vegetable.category}',
                  ),
                  trailing: Text(
                    vegetable.expiryDate.isBefore(DateTime.now())
                        ? 'Expired'
                        : 'Valid',
                    style: TextStyle(
                      color: vegetable.expiryDate.isBefore(DateTime.now())
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
