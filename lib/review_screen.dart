import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> categorizedItems;

  ReviewScreen({required this.categorizedItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review List'),
      ),
      body: ListView.builder(
        itemCount: categorizedItems.keys.length,
        itemBuilder: (context, index) {
          String category = categorizedItems.keys.elementAt(index);
          List<Map<String, dynamic>> items = categorizedItems[category]!;
          return ExpansionTile(
            title: Text(category),
            children: items.map((item) {
              return ListTile(
                title: Text('${item['name']} (${item['quantity']}x)'),
                subtitle: item['price'] != null
                    ? Text('Price: \$${item['price']}')
                    : Text('Price: N/A'),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
