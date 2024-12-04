import 'package:flutter/material.dart';
import 'inventory_screen.dart';
import 'order_screen.dart';
import 'report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thoga Kade'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Thoga Kade!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400],
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InventoryScreen()));
              },
              icon: const Icon(Icons.inventory),
              label: const Text('Manage Inventory'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Place Orders'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[400],
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportScreen()));
              },
              icon: const Icon(Icons.bar_chart),
              label: const Text('View Reports'),
            ),
          ],
        ),
      ),
    );
  }
}
