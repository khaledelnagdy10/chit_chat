import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
   ProfileBody({super.key});
CollectionReference db = FirebaseFirestore.instance.collection('user');

 String userId = FirebaseAuth.instance.currentUser!.uid;

 
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<DocumentSnapshot>( 
           future: db.doc(userId).get(),

      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('something went wrong');
        } 
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('User not found.'));
        }
       if (FirebaseAuth.instance.currentUser == null) {
         return const Center(child: Text('Currentuser not found'),);
       }

        

       Map<String,dynamic>? userData = snapshot.data !.data() as Map<String,dynamic>;
       String fullName =  userData ['full name']?? 'N/A';
       String email =  userData ['email']?? 'N/A'; 
      return Column(
        children: [
          const CustomAppBar(text: 'Profile',  
          actionIcon: Icon(Icons.search)),
          const SizedBox(height: 50,),
      const SizedBox(height: 90,),
          Icon(Icons.account_circle,size: 150,color: Colors.grey[750],),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:  40.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Full Name  '),
                 
                 Text(fullName)
              ],
            ),
          ), 
          const Divider(),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:  40.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text('Email'),
                 
                 Text(email)]
            ),
          ), 
        ],
      );
      
      },
      
    )
     ;
  }
}