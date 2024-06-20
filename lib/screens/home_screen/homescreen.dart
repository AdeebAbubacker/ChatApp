

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('App Logo'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          PostWidget(
            username: 'Username',
            timeAgo: '2 hours ago',
            content: 'This is a sample post content. It can include text and images.',
            imageUrl: 'https://placehold.co/300x200',
          ),
          PostWidget(
            username: 'Username',
            timeAgo: '5 hours ago',
            content: 'Another sample post content.',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Channels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {

  final String username;
  final String timeAgo;
  final String content;
  final String? imageUrl;

  PostWidget({required this.username, required this.timeAgo, required this.content, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://placehold.co/50x50'),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(username, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text(timeAgo, style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(content, style: TextStyle(color: Colors.white)),
            if (imageUrl != null) ...[
              SizedBox(height: 16),
              Image.network(imageUrl!),
            ],
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up, color: Colors.white54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.comment, color: Colors.white54),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share, color: Colors.white54),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

