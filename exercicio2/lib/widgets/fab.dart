import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback toggle;
  final Function(int)? onIconTapped;

  const FAB({
    Key? key,
    required this.isExpanded,
    required this.toggle,
    this.onIconTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<IconData> miniFabIcons = [
      Icons.phone,
      Icons.email,
      Icons.message,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isExpanded)
          ...List.generate(miniFabIcons.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                heroTag: 'miniFab$index',
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                child: Icon(miniFabIcons[index]),
                onPressed: () => onIconTapped?.call(index),
              ),
            );
          }),
        FloatingActionButton(
          child: Icon(isExpanded ? Icons.close : Icons.add),
          onPressed: toggle,
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ],
    );
  }
}

