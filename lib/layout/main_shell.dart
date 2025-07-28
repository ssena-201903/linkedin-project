import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/home/home_page.dart';
import 'package:linkedin_clone/views/jobs/jobs_page.dart';
import 'package:linkedin_clone/views/network/network_page.dart';
import 'package:linkedin_clone/views/notifications/notifications_page.dart';
import 'package:linkedin_clone/views/publish/publish_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  bool _isNavbarVisible = true;

  void _handleScroll(ScrollDirection direction) {
    if (direction == ScrollDirection.reverse && _isNavbarVisible) {
      setState(() {
        _isNavbarVisible = false;
      });
    } else if (direction == ScrollDirection.forward && !_isNavbarVisible) {
      setState(() {
        _isNavbarVisible = true;
      });
    }
  }

  // pages list
  List<Widget> _pages = [];

  // path string list for png icon paths
  final List<String> _passiceIconPaths = [
    "assets/icons/home.png",
    "assets/icons/network.png",
    "assets/icons/make_post.png",
    "assets/icons/notifications.png",
    "assets/icons/jobs.png",
  ];

  // path string list for selected png icon paths
  final List<String> _activeIconPaths = [
    "assets/icons/home_selected.png",
    "assets/icons/network_selected.png",
    "assets/icons/make_post.png",
    "assets/icons/notifications_selected.png",
    "assets/icons/jobs_selected.png",
  ];

  // created private method for building dynamic icon
  Widget _buildIcon(int index) {
    // if current index equals to coming index play active icon, otherwise play passive icon
    String path =
        _selectedIndex == index
            ? _activeIconPaths[index]
            : _passiceIconPaths[index];

    // return png icon
    return Image.asset(path, width: 24, height: 24);
  }

  @override
  void initState() {
    super.initState();

    // defined pages
    _pages = [
      HomePage(onScroll: _handleScroll,),
      NetworkPage(),
      PublishPage(),
      NotificationsPage(),
      JobsPage(),
    ];
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgPageColor,
      body: _pages[_selectedIndex],
      // created bottom navigation bar
      bottomNavigationBar: Visibility(
        visible: _isNavbarVisible,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: List.generate(_activeIconPaths.length, (index) {
            return BottomNavigationBarItem(
              icon: _buildIcon(index),
              label:
                  [
                    "Ana Sayfa",
                    "Profesyonel Ağım",
                    "Yayınla",
                    "Bildirimler",
                    "İş İlanları",
                  ][index],
            );
          }),
        ),
      ),
    );
  }
}
