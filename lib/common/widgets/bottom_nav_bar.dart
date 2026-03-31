import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavScaffold extends StatelessWidget {
  final StatefulNavigationShell shell;

  const BottomNavScaffold({super.key, required this.shell});

  void _onTap(int index) {
    shell.goBranch(index, initialLocation: index == shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: shell,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: shell.currentIndex,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],

        onTap: _onTap,
      ),
    );
  }
}
