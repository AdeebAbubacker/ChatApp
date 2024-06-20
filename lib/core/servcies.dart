import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUserToFirestore(String uid, Map<String, dynamic> userData) async {
  try {
    await FirebaseFirestore.instance.collection('Users').doc(uid).set(userData);
    print("User added successfully!");
  } catch (e) {
    print("Error adding user: $e");
  }
}

