import 'package:chit_chat/constans.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
showDialog(context: context, builder: (context){

  return AlertDialog(
    title: Text('Create new group'),

    content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Group Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       ElevatedButton( 
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      child: Text("Create"),
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton( 
                      onPressed: () {
                        Navigator.pop(context); 
                      },
                      child: Text('Cancel'),
                    ),
                   ],)



                
                  ],
                ),


  );
}

);

    },
    child: 

    Container(
      decoration: const BoxDecoration(shape: BoxShape.circle,color: kPrimaryColor) ,
      child:   const Icon(Icons.add))
    
    );
  }
}