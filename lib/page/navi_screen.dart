import 'package:flutter/material.dart';
import 'package:flutter_netflix/page/home_page.dart';
import 'package:custom_navigator/custom_navigator.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens=[
    // be used to persist the widget state in storage after the destruction,
    // and will be restored when recreated.
    HomePage(key:PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const{
    'Home':Icons.home,
    'Search':Icons.search,
    'Coming Soon':Icons.queue_play_next,
    'Downloads':Icons.file_download,
    'More':Icons.menu,
  };

  int _currentIndex = 0;

  // 記錄navigator info
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomNavigator(  //可留存紀錄的navigator
          home: _screens[_currentIndex],
          navigatorKey: navigatorKey,
          pageRoute: PageRoutes.materialPageRoute,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: _icons.map((title, icon) => MapEntry(
              title,
              BottomNavigationBarItem(
                icon: Icon(icon, size:30.0),
                label: title,
              )))
              .values
              .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index)=> setState(() {
          //讓頁面退回來，指定了這一個navigator
          navigatorKey.currentState.maybePop();
          _currentIndex=index;
        }), //callback
        )
    );
  }
}
