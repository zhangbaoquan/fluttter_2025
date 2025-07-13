import 'package:flutter/material.dart';
import 'package:fluttter_2025/sample/image_page.dart';
import 'package:fluttter_2025/sample/plugin_color_page.dart';
import 'package:fluttter_2025/sample/res_page.dart';

import 'gesture_page.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class BottomTabNavigatorPage extends StatefulWidget {
  const BottomTabNavigatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _BottomTabNavigatorPageState();
}

class _BottomTabNavigatorPageState extends State<BottomTabNavigatorPage>
    with SingleTickerProviderStateMixin {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动
        children: <Widget>[
          PluginUse(),
          const GesturePage(),
          ResPage(),
          ImagePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, // 固定住底部每个Item
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            label: '搜索',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.camera_alt,
              color: _activeColor,
            ),
            label: '旅拍',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: _activeColor,
              ),
              label: '我的'),
        ],
      ),
    );
  }
}
