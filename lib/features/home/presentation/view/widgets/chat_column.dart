import 'package:chit_chat/features/home/presentation/view/group_chat_view.dart';
import 'package:flutter/material.dart';

class AllChatsScreen extends StatelessWidget {
  final String groupName;

  const AllChatsScreen({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GroupChatView();
            }));
          },
          child: Row(
            children: [
              const CircleAvatar(),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(groupName),
                  const Text('Last message or details here'),
                ],
              ),
              const Spacer(),
              const Text('Date'),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
