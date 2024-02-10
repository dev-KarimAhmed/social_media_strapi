import 'package:flutter/material.dart';
import 'package:social_media_app/core/components/custom_sperator.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const Text('Chat');
          },
          separatorBuilder: (context, index) => const CustomSperator(),
          itemCount: 5),
    );
  }
}

