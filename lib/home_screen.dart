import 'package:femmebuy/category_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:femmebuy/ItemInput.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, List<String>> _categoryItems = {};
  final List<String> _boughtItems = [];
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      _categoryItems[category.name] = [];
    }
  }

  void _addItem(String item) {
    if (_selectedCategory != null) {
      setState(() {
        _categoryItems[_selectedCategory]?.add(item);
      });
    }
  }

  void _markAsBought(int index) {
    setState(() {
      _boughtItems.add(_categoryItems[_selectedCategory]![index]);
      _categoryItems[_selectedCategory]!.removeAt(index);
    });
  }

  void _shareList() {
    final String list = _boughtItems.join(', ');
    Share.share('Check out my shopping list: $list');
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FemmeBuy'),
        backgroundColor: Colors.pink[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _shareList,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to FemmeBuy!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CategorySelector(
                onCategorySelected: _selectCategory,
                onItemAdded: (String category, String item) {},
                onMarkAsBought: (String item) {},
              ),
              const SizedBox(height: 20),
              if (_selectedCategory != null)
                ItemInput(
                  category: _selectedCategory!,
                  onItemAdded: _addItem,
                  items: _categoryItems[_selectedCategory!] ?? [],
                  onMarkAsBought: _markAsBought,
                ),
              const SizedBox(height: 20),
              const Text(
                'Bought Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ..._boughtItems.map((item) => ListTile(
                title: Text(item, style: TextStyle(decoration: TextDecoration.lineThrough)),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
