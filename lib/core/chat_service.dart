import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Function to create a chat between two users.
/// Returns the chat ID (document ID in Firestore).
Future<String> createChat(String userId1, String userId2) async {
  // Ensure userId1 and userId2 are different
  if (userId1 == userId2) {
    throw ArgumentError('User IDs must be different.');
  }

  // Sort user IDs to maintain consistent chat document structure
  List<String> userIds = [userId1, userId2];
  userIds.sort();

  // Check if a chat already exists between these users
  QuerySnapshot query = await FirebaseFirestore.instance
      .collection('Chats')
      .where('users', isEqualTo: userIds)
      .get();

  // If a chat exists, return its ID
  if (query.docs.isNotEmpty) {
    return query.docs.first.id;
  }

  // If no chat exists, create a new chat document
  DocumentReference newChatRef = FirebaseFirestore.instance.collection('Chats').doc();
  await newChatRef.set({
    'users': userIds,
    // You can add more fields as needed for additional chat metadata
  });

  return newChatRef.id;
}
