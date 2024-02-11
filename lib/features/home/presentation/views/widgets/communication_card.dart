import 'package:flutter/material.dart';
import 'package:social_media_app/features/authentication/data/models/register/register.dart';

class CommunicationCard extends StatelessWidget {
  const CommunicationCard({
    super.key,
    required this.authModel,
  });
  final AuthModel authModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          const Image(
            width: double.infinity,
            image: NetworkImage(
                'https://img.freepik.com/free-photo/abstract-networking-concept-still-life-arrangement_23-2149035700.jpg?size=626&ext=jpg'),
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              authModel.user?.username ?? 'Communicate with friends',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
