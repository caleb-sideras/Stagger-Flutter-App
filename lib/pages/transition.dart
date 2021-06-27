import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SecondPageRoute extends PageRouteBuilder {
  SecondPageRoute()
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => SecondPage());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // return new FadeTransition(opacity: animation, child: new SecondPage());

     var begin = Offset(0.0, 1.0);
  var end = Offset.zero;
  var curve = Curves.ease;

  var tween = Tween(begin: begin, end: end);
  var curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );
    return ScaleTransition(
  scale: animation,
  child: Opacity(
    opacity: 1,
    child: SecondPage()));
  
}}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//   var begin = Offset(0.0, 1.0);
//   var end = Offset.zero;
//   var curve = Curves.ease;

//   var tween = Tween(begin: begin, end: end);
//   var curvedAnimation = CurvedAnimation(
//     parent: animation,
//     curve: curve,
//   );

//   return SlideTransition(
//     position: tween.animate(curvedAnimation),
//     child: child,
//   );
// }
//   );
// }

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: new Center(
        child: new Text('This is the second page'),
      ),
    );
  }
}