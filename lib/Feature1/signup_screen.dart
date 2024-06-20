import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:watsapp/Feature1/home_screen.dart';
import 'package:watsapp/Feature1/profilesetup_screen.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  User? user = userCredential.user;

                  if (user != null) {
                    await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
                      'email': user.email,
                      'username': 'New User',
                      'profilePicture': '',
                      'bio': '',
                      'status': 'Hey there! I am using WhatsApp.',
                      'lastSeen': FieldValue.serverTimestamp(),
                      'isOnline': true,
                      'contacts': [],
                      'groups': [],
                      'deviceTokens': [],
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetupPage()));
                  }
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
