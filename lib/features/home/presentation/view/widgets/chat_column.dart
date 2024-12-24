import 'package:chit_chat/features/home/presentation/view/group_chat_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllChatsScreen extends StatefulWidget {
  final String groupName;

  const AllChatsScreen({super.key, required this.groupName});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  String currentTime = DateTime.now().toString();
  void updateTime() {
    setState(() {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  @override
  void initState() {
    updateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GroupChatView();
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
                    Text(widget.groupName),
                    const Text('Last message or details here'),
                  ],
                ),
                const Spacer(),
                Text(
                  currentTime,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
