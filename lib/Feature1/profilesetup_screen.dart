import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watsapp/Feature1/home_screen.dart';
import 'package:watsapp/Feature1/list_chat_screen.dart';

class ProfileSetupPage extends StatefulWidget {
  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<String?> _uploadImage(File imageFile) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profilePictures')
          .child(user.uid);
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                child: _imageFile == null ? Icon(Icons.camera_alt, size: 40) : null,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  String? profilePictureUrl;
                  if (_imageFile != null) {
                    profilePictureUrl = await _uploadImage(_imageFile!);
                  }

                  await FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
                    'phoneNumber': phoneController.text,
                    'username': nameController.text,
                    'profilePicture': profilePictureUrl ?? '',
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListUsersScreen()));
                }
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
