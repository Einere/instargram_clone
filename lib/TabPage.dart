import 'package:flutter/material.dart';
import 'package:instagram_clone/AccountPage.dart';
import 'package:instagram_clone/HomePage.dart';
import 'package:instagram_clone/SearchPage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [HomePage(), SearchPage(), AccountPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: onTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account')
          ],
        fixedColor: Colors.black,
      ),
    );
  }

  void onTap(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }
}
