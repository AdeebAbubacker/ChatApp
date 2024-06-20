import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<String>> listUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Users').get();
      List<String> userList = [];
      querySnapshot.docs.forEach((doc) {
        userList.add(doc.id); // Assuming each user's document ID is their unique identifier
      });
      return userList;
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }
}
