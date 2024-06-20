import 'package:design_implementation/screens/view_chat/widget/profile_info_widget.dart';
import 'package:design_implementation/screens/view_chat/widget/user_chat_widget.dart';
import 'package:flutter/material.dart';

class SnapchatChatScreen extends StatefulWidget {
  const SnapchatChatScreen({super.key});

  @override
  State<SnapchatChatScreen> createState() => _SnapchatChatScreenState();
}

class _SnapchatChatScreenState extends State<SnapchatChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileInfoWidget(),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    child: UserChatWidget(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
