import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Reports'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.bar_chart, color: Colors.green),
                title: const Text('Sales Report'),
                subtitle: const Text('View the daily sales report.'),
                onTap: () {
                  // Navigate to Sales Report Screen
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.inventory, color: Colors.blue),
                title: const Text('Inventory Report'),
                subtitle: const Text('View the daily inventory status.'),
                onTap: () {
                  // Navigate to Inventory Report Screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
