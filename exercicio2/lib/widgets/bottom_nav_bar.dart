import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;

  const BottomNavBar({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista de icones
    final icons = [
      Icons.menu,
      Icons.collections,
      Icons.apps,
      Icons.info,
    ];

    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          // espaço para o FAB no meio 
          if (index == 2) {
            return Row(
              children: [
                const SizedBox(width: 48),
                IconButton(
                  icon: Icon(icons[index]),
                  onPressed: () => onTabSelected(index),
                ),
              ],
            );
          }

          return IconButton(
            icon: Icon(icons[index]),
            onPressed: () => onTabSelected(index),
          );
        }),
      ),
    );
  }
}
