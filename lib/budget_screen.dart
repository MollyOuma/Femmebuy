import 'package:flutter/material.dart';

class ShoppingItem {
  final String name;
  final double price;

  ShoppingItem(this.name, this.price);
}

class BudgetScreen extends StatelessWidget {
  final List<ShoppingItem> items;

  const BudgetScreen({super.key, required this.items});

  double _calculateTotal() {
    return items.fold(0, (total, item) => total + item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Tracker'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total Spending:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('\$${_calculateTotal().toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, color: Colors.pinkAccent)),
          ],
        ),
      ),
    );
  }
}
