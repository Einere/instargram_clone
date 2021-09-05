import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/AccountPage.dart';
import 'package:instagram_clone/HomePage.dart';
import 'package:instagram_clone/SearchPage.dart';

class TabPage extends StatefulWidget {
  final User user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages;


  @override
  void initState() {
    super.initState();
    _pages = [HomePage(widget.user), SearchPage(widget.user), AccountPage(widget.user)];
  }

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
