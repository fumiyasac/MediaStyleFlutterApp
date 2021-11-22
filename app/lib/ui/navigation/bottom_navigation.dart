import 'package:flutter/material.dart';
import 'package:media_style_app/common/support/localization/localized.dart';
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
  String _getSelectedTitle(int index, BuildContext context) {
    List<String> titleList = [
      Localized.of(context).homeScreenTitle,
      Localized.of(context).galleriesScreenTitle,
      Localized.of(context).profileScreenTitle
    ];
    return titleList.elementAt(index);
  }

  // MEMO: 選択したインデックス値に応じて表示する画面の内容
  Widget _getSelectedScreen(int index, BuildContext context) {
    List<Widget> screenList = [
      HomeScreen(),
      GalleriesScreen(),
      ProfileScreen()
    ];
    return screenList.elementAt(index);
  }

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
        title: Text(
            _getSelectedTitle(_selectedIndex, context)
        ),
      ),
      body: _getSelectedScreen(_selectedIndex, context),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
                _getSelectedTitle(0, context)
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_album),
            title: Text(
                _getSelectedTitle(1, context)
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
                _getSelectedTitle(2, context)
            )
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}