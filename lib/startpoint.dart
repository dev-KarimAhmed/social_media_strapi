import 'package:flutter/material.dart';
import 'package:social_media_app/features/authentication/presentation/views/login_view.dart';

class StartPoint extends StatelessWidget {
  const StartPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (route) => true);
            },
            child: Text('Start')),
      ),
    );
  }
}
