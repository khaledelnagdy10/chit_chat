import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const CustomAppBar(text: 'Profile',  
        actionIcon: Icon(Icons.search)),
        const SizedBox(height: 50,),
    const SizedBox(height: 90,),
        Icon(Icons.account_circle,size: 150,color: Colors.grey[750],),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal:  40.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text('Full Name  '),
               
               Text('Khaled elnagdy')
            ],
          ),
        ), 
        const Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal:  40.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text('Email'),
               
               Text('Khaledelnagdy@gmail.com')
            ],
          ),
        ), 
      ],
    )
     ;
  }
}