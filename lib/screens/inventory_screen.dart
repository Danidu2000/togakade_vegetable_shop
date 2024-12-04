import 'package:flutter/material.dart';
import 'add_vegetable_screen.dart';
import 'view_inventory_screen.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory Management'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.add, color: Colors.green),
                title: const Text('Add Vegetable'),
                subtitle: const Text('Add new vegetables to the inventory.'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddVegetableScreen()));
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.list, color: Colors.blue),
                title: const Text('View Inventory'),
                subtitle: const Text('See the list of all available vegetables.'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewInventoryScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
