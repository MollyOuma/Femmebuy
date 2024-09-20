import 'dart:math';

// Simulated AI service for shopping suggestions
class AIService {
  final List<String> _suggestions = [
    'Butter', 'Jam', 'Milk', 'Eggs', 'Cheese', 'Bread',
  ];

  List<String> getSuggestions(String query) {
    return _suggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

// Usage example
void getSuggestionsExample() {
  final aiService = AIService();
  final suggestions = aiService.getSuggestions('br');
  print(suggestions); // Output: [Bread]
}
