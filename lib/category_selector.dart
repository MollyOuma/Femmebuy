import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);
}

final List<Category> categories = [
  Category('Groceries', Icons.local_grocery_store),
  Category('Fashion', Icons.checkroom),
  Category('Electronics', Icons.electrical_services),
];

class CategorySelector extends StatelessWidget {
  final Function(String category, String item) onItemAdded;
  final Function(String item) onMarkAsBought;
  final Function(String category) onCategorySelected;

  CategorySelector({
    required this.onItemAdded,
    required this.onMarkAsBought,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Set a fixed height for the GridView
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Notify the selected category
              onCategorySelected(category.name);
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(category.icon, size: 40, color: Colors.pinkAccent),
                  const SizedBox(height: 8),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
