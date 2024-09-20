import 'package:flutter/material.dart';

class ItemInput extends StatelessWidget {
  final String category;
  final Function(String) onItemAdded;
  final List<String> items;
  final Function(int) onMarkAsBought;

  ItemInput({
    required this.category,
    required this.onItemAdded,
    required this.items,
    required this.onMarkAsBought,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Add Item to $category', style: TextStyle(fontSize: 18)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Item Name',
            border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              onItemAdded(controller.text);
              controller.clear();
            }
          },
          child: const Text('Add Item'),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              trailing: IconButton(
                icon: Icon(Icons.check),
                onPressed: () => onMarkAsBought(index),
              ),
            );
          },
        ),
      ],
    );
  }
}
