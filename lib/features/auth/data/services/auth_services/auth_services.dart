import 'package:chit_chat/core/utils/widgets/custom_scaffold_messanger.dart';
import 'package:chit_chat/features/home/presentation/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  
   void createUserWithEmailAndPassword  (context ,String fullName,String emailAddress ,password )async{

     try {
                    UserCredential credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailAddress,
                      password: password,
                    );

                   customScaffoldMessanger(context, 'sucssesfull', Colors.green);
                 
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                   customScaffoldMessanger(context, 'Weak Password', Colors.red);
                    } else if (e.code == 'email-already-in-use') {
                    customScaffoldMessanger(context, 'Email already in use', Colors.red);
                    }
                  } catch (e) {
                    customScaffoldMessanger(context, e.toString(), Colors.red);
                  }
   }

Future signInWithEmailAndPassword  (context ,String emailAddress ,password )async{

      try {
                    UserCredential credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: emailAddress,
                      password: password,
                    );
                  
                  
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const HomeView();
                   }));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-credintioal') {
                      customScaffoldMessanger(context, 'Email or password is wrong', Colors.red);
                     
                    } 
                  } catch (e) {
                    print(e);
                  }
   }

}