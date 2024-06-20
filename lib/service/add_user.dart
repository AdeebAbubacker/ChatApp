import 'package:flutter/material.dart';
import 'package:watsapp/core/servcies.dart';

void addUser() {
  String uid = '12'; // Replace with the actual UID
  Map<String, dynamic> userData = {
    'username': 'John Doe',
    'profilePicture': 'https://firebasestorage.googleapis.com/v0/b/your-app-id/o/profilePictures%2Fuid.jpg',
    'bio': 'Living life to the fullest!',
    'phoneNumber': '+1234567890',
    'status': 'Hey there! I am using WhatsApp.',
    'lastSeen': DateTime.now(),
    'isOnline':true,
    'contacts': ['uid1', 'uid2', 'uid3'],
    'groups': ['groupId1', 'groupId2', 'groupId3'],
    'deviceTokens': ['token1', 'token2', 'token3']
  };

  addUserToFirestore(uid, userData);
}


class AddDatToFirebase extends StatefulWidget {
  const AddDatToFirebase({super.key});

  @override
  State<AddDatToFirebase> createState() => _AddDatToFirebaseState();
}

class _AddDatToFirebaseState extends State<AddDatToFirebase> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           ElevatedButton(
            onPressed: addUser,
            child: Text('Add User'),
          ),
          
        ],),
    ),);
  }
}