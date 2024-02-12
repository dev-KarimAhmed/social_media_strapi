import 'package:flutter/material.dart';

Future<dynamic> navigateTo(BuildContext context, Widget view) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child, // Use the child parameter instead of view
        );
      },
    ),
  );
}

//========================== Not worked correctly  ===========]
// Future<dynamic> navigateWithoutBack(BuildContext context , Widget view) {
//   return Navigator.of(context).pushAndRemoveUntil(
//     PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) =>  view,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var begin =const Offset(0.0, 0.0);
//         var end = const Offset(0.0, 1.0); // Change the end position to move downwards
//         var curve = Curves.ease;

//         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//         var offsetAnimation = animation.drive(tween);

//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     ),
//     (route) => false,
//   );
// }

Future<dynamic> navigateWithoutBack(BuildContext context, Widget view) {
  return Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => view),
    (route) => false,
  );
}
