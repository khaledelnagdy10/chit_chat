import 'package:chit_chat/constans.dart';
import 'package:chit_chat/features/home/data/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Create new group'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: "Group Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              final groupName = controller.text.trim();
                              if (groupName.isNotEmpty) {
                                BlocProvider.of<HomeCubit>(context)
                                    .homeCubit(groupName);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text("Create"),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              });
        },
        child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor),
            child: const Icon(Icons.add)));
  }
}
