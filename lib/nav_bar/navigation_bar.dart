import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  //final List<IconData> iconList;
  const NavBar({required this.icons, required this.iconsActive, required this.onPressed, required this.activeIndex});
  final List<IconData> icons;
  final List<IconData> iconsActive;
  final Function(int) onPressed;
  final int activeIndex;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFF1E1E1E),
      // decoration: BoxDecoration(
      //     border: Border(
      //   top: BorderSide(width: 0.3, color: Colors.white.withOpacity(0.4), ),
      // )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
        for(var i= 0; i < widget.icons.length; i++)
          IconButton(
              onPressed: () => widget.onPressed(i),
              icon: i == widget.activeIndex ? Icon(widget.iconsActive[i]) : Icon(widget.icons[i]),
              color: i == widget.activeIndex ? Colors.white : Colors.grey//Colors.white.withOpacity(0.4)
          )
      ],),
       );
  }
}