import 'package:design_implementation/core/text_styles.dart';
import 'package:flutter/material.dart';

class UserChatWidget extends StatelessWidget {
  const UserChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 197, 196, 196),
                  radius: 25,
                  child: Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Annmary Paulose",
                style: TextStyles.rubik16grey66,
              ),
              Row(
                children: [
                  Icon(
                    Icons.message,
                    color: const Color.fromARGB(255, 197, 195, 195),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Tap to Chat",
                    style: TextStyles.rubik12grey66,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
