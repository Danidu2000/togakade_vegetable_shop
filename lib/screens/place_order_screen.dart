import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder design for placing an order
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Place Order Screen - Work in Progress',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
