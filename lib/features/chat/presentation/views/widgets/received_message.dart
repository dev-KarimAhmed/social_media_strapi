import 'package:flutter/material.dart';

class ReceiverMessage extends StatelessWidget {
  const ReceiverMessage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child:const Text('message.text!')),
    );
  }
}
