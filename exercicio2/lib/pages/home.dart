import 'package:flutter/material.dart';
import '../widgets/fab.dart';
import '../widgets/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFabExpanded = false;
  String _lastSelected = 'TAB : 0';

  void _toggleFab() {
    setState(() {
      isFabExpanded = !isFabExpanded;
    });
  }

   void _selectTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomAppBar with FAB"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FAB(
        isExpanded: isFabExpanded,
        onIconTapped: _selectFab,
        toggle: _toggleFab,
      ),
      bottomNavigationBar: BottomNavBar(onTabSelected: _selectTab),
      body: Center(
      child: Text(
        _lastSelected,
        style: TextStyle(fontSize: 24),
      ),
    ),
    );
  }
}
