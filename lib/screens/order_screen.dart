import 'package:flutter/material.dart';
import 'place_order_screen.dart';
import 'order_history_screen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Management'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.add_shopping_cart, color: Colors.blue),
                title: const Text('Place Order'),
                subtitle: const Text('Place a new customer order.'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceOrderScreen()));
                },
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.orange),
                title: const Text('Order History'),
                subtitle: const Text('View previously placed orders.'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
