import 'package:flutter/material.dart';
import 'package:media_style_app/ui/screen/home_screen.dart';
import 'package:media_style_app/ui/screen/galleries_screen.dart';
import 'package:media_style_app/ui/screen/profile_screen.dart';

// StatefulWidgetとしてBottomNavigationを作成する
class BottomNavigation extends StatefulWidget {

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

// BottomNavigationWidgetで利用するStateの定義
class _BottomNavigationState extends State<BottomNavigation> {

  // MEMO: 選択したインデックス値
  int _selectedIndex = 0;

  // MEMO: 選択したインデックス値に応じて表示するタイトルの内容
  List<Text> _selectedTitle = [
    Text('Home'),
    Text('Galleries'),
    Text('Profile')
  ];

  // MEMO: 選択したインデックス値に応じて表示する画面の内容
  List<Widget> _selectedScreen = [
    HomeScreen(),
    GalleriesScreen(),
    ProfileScreen()
  ];

  // MEMO: bottomNavigationBarに配置した要素を押下した際の処理
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // MEMO: Widget要素構築
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _selectedTitle.elementAt(_selectedIndex),
      ),
      body: _selectedScreen.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text('Galleries')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}