import 'package:flutter/material.dart';

class CommunicationCard extends StatelessWidget {
  const CommunicationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 10,
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image(
            width: double.infinity,
            image: NetworkImage(
                'https://img.freepik.com/free-photo/abstract-networking-concept-still-life-arrangement_23-2149035700.jpg?size=626&ext=jpg'),
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Communicate with friends',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
