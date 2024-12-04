import 'package:flutter/material.dart';
import '../models/vegetable.dart';
import '../managers/inventory_manager.dart';

class AddVegetableScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  AddVegetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vegetable'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Enter Vegetable Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Vegetable Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter vegetable name' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'Price per Kg',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => double.tryParse(value!) == null ? 'Enter valid price' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(
                  labelText: 'Quantity (Kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => double.tryParse(value!) == null ? 'Enter valid quantity' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter category' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (yyyy-MM-dd)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => DateTime.tryParse(value!) == null ? 'Enter valid date' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final vegetable = Vegetable(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: _nameController.text,
                      pricePerKg: double.parse(_priceController.text),
                      availableQuantity: double.parse(_quantityController.text),
                      category: _categoryController.text,
                      expiryDate: DateTime.parse(_expiryDateController.text),
                    );
                    final manager = InventoryManager();
                    await manager.addVegetable(vegetable);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Vegetable added successfully!')));
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
