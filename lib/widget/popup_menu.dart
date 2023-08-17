import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Text>(
      // onSelecte,
      itemBuilder: (context) {
      return const [
        PopupMenuItem(
          value: Text('BBC'),
          child: Text('BBC'),
        ),
        PopupMenuItem(
          value: Text('BBC'),
          child: Text('CNN'),
        ),
        PopupMenuItem(
          value: Text('BBC'),
          child: Text('AL JAJIRA'),
        ),
      ];
    });
  }
}
