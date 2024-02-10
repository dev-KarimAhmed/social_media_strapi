// class ChatItem extends StatelessWidget {
//   const ChatItem({
//     super.key,
//     required this.model,
//   });
//   final UserModel model;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => ChatDetailsScreen(model: model,)));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: NetworkImage(model.image),
//               radius: 25,
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Expanded(
//                 child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(model.name),
//                     SizedBox(width: 5),
//                   ],
//                 ),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
