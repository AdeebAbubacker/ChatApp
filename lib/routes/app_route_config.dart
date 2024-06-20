import 'package:flutter/material.dart';

void navigateToScreen2(BuildContext context, Message message) =>
    Navigator.of(context).pushNamed('/screen2', arguments: message);


void navigateToScreen3(BuildContext context) =>
    Navigator.of(context).pushNamed('/screen3');



// lib/models/message.dart
class Message {
  String content1;
  String content2;
  Message({
    required this.content1,
    required this.content2,
  });
}
