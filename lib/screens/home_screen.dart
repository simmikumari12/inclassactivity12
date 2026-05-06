import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../services/firestore_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirestoreService service = FirestoreService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void clearFields() {
    nameController.clear();
    quantityController.clear();
    priceController.clear();
  }

  void addItem() {
    if (_formKey.currentState!.validate()) {
      final item = Item(
        id: '',
        name: nameController.text,
        quantity: int.parse(quantityController.text),
        price: double.parse(priceController.text),
      );

      service.addItem(item);
      clearFields();
      Navigator.pop(context);
    }
  }

  void showAddDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add Item"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) =>
                    value!.isEmpty ? "Enter name" : null,
              ),
              TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Quantity"),
                validator: (value) =>
                    int.tryParse(value!) == null
                        ? "Enter valid number"
                        : null,
              ),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Price"),
                validator: (value) =>
                    double.tryParse(value!) == null
                        ? "Enter valid price"
                        : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          ElevatedButton(onPressed: addItem, child: Text("Add")),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<List<Item>>(
        stream: service.getItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          }

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;

          if (items.isEmpty) {
            return Center(child: Text("No items available"));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(
                    "Qty: ${item.quantity} | \$${item.price.toStringAsFixed(2)}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    service.deleteItem(item.id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}