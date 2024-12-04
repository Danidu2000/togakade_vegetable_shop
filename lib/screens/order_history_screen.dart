import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder design for viewing order history
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Order History Screen - Work in Progress',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
