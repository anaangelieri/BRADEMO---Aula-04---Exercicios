import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;

  const BottomNavBar({Key? key, required this.onTabSelected}) : super(key: key); //construtor

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => onTabSelected(0),
          ),
          IconButton(
            icon: Icon(Icons.collections),
            onPressed: () => onTabSelected(1),
          ),
          SizedBox(width: 48), 
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () => onTabSelected(2),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () => onTabSelected(3),
          ),
        ],
      ),
    );
  }
}
