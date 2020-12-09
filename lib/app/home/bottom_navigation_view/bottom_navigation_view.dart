import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/bottom_navigation_view/bottom_navigation_change_notifier.dart';
import 'package:flutterblog/app/home/feed/feed_page.dart';
import 'package:flutterblog/app/home/profile/profile_page.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatelessWidget {
  static Widget create(BuildContext context) {
    return ChangeNotifierProvider<BottomNavigationChangeNotifier>(
      create: (_) => BottomNavigationChangeNotifier(0),
      child: BottomNavigationView(),
    );
  }

  static List<Widget> _items = [
    FeedPage(),
    Container(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavigationView =
        Provider.of<BottomNavigationChangeNotifier>(context);
    return Scaffold(
      body: _items.elementAt(bottomNavigationView.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationView.currentIndex,
        onTap: (index) {
          bottomNavigationView.changeView(index);
          // setState(() => _selectedIndex = index);
        },
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.home),
            icon: Icon(EvaIcons.homeOutline),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.fileAdd),
            icon: Icon(EvaIcons.fileAddOutline),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(EvaIcons.person),
            icon: Icon(EvaIcons.personOutline),
            label: '',
          ),
        ],
      ),
    );
  }
}
