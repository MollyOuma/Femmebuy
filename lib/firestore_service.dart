import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addItemToFirestore(String item) {
    _firestore.collection('shopping_lists').add({
      'item': item,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<List<String>> getItemsFromFirestore() {
    return _firestore.collection('shopping_lists')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc['item'] as String).toList());
  }
}
