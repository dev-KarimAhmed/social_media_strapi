import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({
    super.key,
  
  });
 
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child:const Text('message.text!')),
    );
  }
}
