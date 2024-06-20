import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:watsapp/Feature1/chat_with_user.dart';
import 'package:watsapp/core/chat_service.dart';
import 'package:watsapp/service/list_user.dart';



class ListUsersScreen extends StatefulWidget {
  @override
  _ListUsersScreenState createState() => _ListUsersScreenState();
}

class _ListUsersScreenState extends State<ListUsersScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  late List<String> _userList;
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      List<String> users = await _firebaseService.listUsers();
      setState(() {
        _userList = users;
        _isLoading = false;
        _hasError = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List of Users'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _hasError
                ? Center(child: Text('Error fetching users.'))
                : _userList.isEmpty
                    ? Center(child: Text('No users found.'))
                    : ListView.builder(
                        itemCount: _userList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async{
                               try {
              // Get current user ID
              

                String currentUserId = FirebaseAuth.instance.currentUser!.uid;

              // Create or retrieve chat ID between current user and recipient
              String chatId = await createChat(currentUserId, _userList[index]);
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ChatScreen(chatId: chatId);
                              },));
            } catch (e) {
              print('Error creating chat: $e');
              // Handle error
            }

                            
                            },
                            child: ListTile(
                              title: Text(_userList[index]),
                            ),
                          );
                        },
                      ),
      ),
    );
  }
}
