import 'package:flutter/material.dart';
import 'package:fluttter_2025/sample/anim_page1.dart';
import 'package:fluttter_2025/sample/anim_page2.dart';
import 'package:fluttter_2025/sample/anim_page3.dart';
import 'package:fluttter_2025/sample/anim_page4.dart';
import 'package:fluttter_2025/sample/bottom_navigator_page.dart';
import 'package:fluttter_2025/sample/channel_page.dart';
import 'package:fluttter_2025/sample/drawer_page.dart';
import 'package:fluttter_2025/sample/future_builder_page.dart';
import 'package:fluttter_2025/sample/gesture_page.dart';
import 'package:fluttter_2025/sample/image_page.dart';
import 'package:fluttter_2025/sample/layout_page.dart';
import 'package:fluttter_2025/sample/lifecycle_app_page.dart';
import 'package:fluttter_2025/sample/lifecycle_widget_page.dart';
import 'package:fluttter_2025/sample/list1_page.dart';
import 'package:fluttter_2025/sample/list2_page.dart';
import 'package:fluttter_2025/sample/list3_page.dart';
import 'package:fluttter_2025/sample/list4_page.dart';
import 'package:fluttter_2025/sample/net_page.dart';
import 'package:fluttter_2025/sample/plugin_color_page.dart';
import 'package:fluttter_2025/sample/res_page.dart';
import 'package:fluttter_2025/sample/sp_page.dart';
import 'package:fluttter_2025/sample/stateful_page.dart';
import 'package:fluttter_2025/sample/stateless_page.dart';
import 'package:fluttter_2025/sample/top_navigator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool useNightTheme = false;

  // 默认显示日间模式
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: _brightness, primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('导航使用')),
        body: _mainItem(),
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'stateful': (BuildContext context) => StatefulPage(),
        'stateless': (BuildContext context) => const StatelessPage(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => const GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'image_use': (BuildContext context) => ImagePage(),
        'lifecycle': (BuildContext context) => const WidgetLifecyclePage(),
        'AppLifecycle': (BuildContext context) => const AppLifecyclePage(),
        'animate': (BuildContext context) => AnimPage(),
        'animate2': (BuildContext context) => AnimateWidgetPage(),
        'animate3': (BuildContext context) => AnimateBuilderPage(),
        'Hero1': (BuildContext context) => const HeroAnimationPage(),
        'TopTab': (BuildContext context) => TopNavigatorBarPage(),
        'BottomTab': (BuildContext context) => BottomTabNavigatorPage(),
        'DrawerPage': (BuildContext context) => DrawerPage(),
        'netPage': (BuildContext context) => NetPage(),
        'FutureBuilderPage': (BuildContext context) => FutureBuilderPage(),
        'sp': (BuildContext context) => SPPage(),
        'list1': (BuildContext context) => ListPage1(),
        'list2': (BuildContext context) => ListPage2(),
        'list3': (BuildContext context) => ListPage3(),
        'list4': (BuildContext context) => ListPage4(),
        'channel': (BuildContext context) => ChannelPage(),
      },
    );
  }

  _mainItem() {
    return Column(
      children: [
        SwitchListTile(
          title: Text('当前是 ： ${useNightTheme ? '夜间模式' : '日间模式'}主题'),
          value: useNightTheme,
          onChanged: (value) {
            setState(() {
              if (value) {
                _brightness = Brightness.dark;
              } else {
                _brightness = Brightness.light;
              }
              useNightTheme = value;
            });
          },
        ),
        const RouterNavigator(),
      ],
    );
  }
}

class RouterNavigator extends StatefulWidget {
  const RouterNavigator({super.key});

  @override
  State<RouterNavigator> createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  // true 表示用路由名跳转，false 表示使用Navigator跳转
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text('${byName ? '' : '不'}通过路由名跳转'),
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
        ),
        Wrap(
          spacing: 10,
          children: [
            _item('插件使用', PluginUse(), 'plugin'),
            _item('资源使用', ResPage(), 'res'),
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            _item('StatefulUsePage', StatefulPage(), 'stateful'),
            _item('StatelessUsePage', StatelessPage(), 'stateless'),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _item('layout', FlutterLayoutPage(), 'layout'),
            _item('手势处理', GesturePage(), 'gesture'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _item('组件生命周期', WidgetLifecyclePage(), 'lifecycle'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _item('应用生命周期', AppLifecyclePage(), 'AppLifecycle'),
            ),
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            _item('传统补间动画', AnimPage(), 'animate'),
            _item('AnimatedWidget 动画', AnimateWidgetPage(), 'animate2'),
            _item('AnimateBuild', AnimateBuilderPage(), 'animate3'),
            _item('Hero 动画', HeroAnimationPage(), 'Hero1'),
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            _item('顶部导航', TopNavigatorBarPage(), 'TopTab'),
            _item('底部导航', BottomTabNavigatorPage(), 'BottomTab'),
            _item('侧拉导航', DrawerPage(), 'DrawerPage'),
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            _item('网络编程', NetPage(), 'netPage'),
            _item('Future 练习', FutureBuilderPage(), 'FutureBuilderPage'),
            _item('本地存储', SPPage(), 'sp'),
          ],
        ),
        Wrap(
          spacing: 10,
          children: [
            _item('列表1', ListPage1(), 'list1'),
            _item('可展开列表', ListPage2(), 'list2'),
            _item('网格布局', ListPage3(), 'list3'),
            _item('下拉刷新', ListPage4(), 'list4'),
            _item('Channel 通信', ChannelPage(), 'channel'),
          ],
        ),
        // Wrap(
        //   spacing: 10,
        //   children: [
        //     _item('上传页面', const UploadPage(), '上传页面'),
        //     _item('图片选择页面', const ImagePickerPage(), '图片选择页面'),
        //     _item('拍照与图片处理', const PhotoPage(), '拍照与图片处理'),
        //   ],
        // ),
        _item2('Image组件使用', ImagePage(), 'image_use'),
      ],
    );
  }

  _item(String title, page, String routeName) {
    return ElevatedButton(
      onPressed: () {
        // true 表示用路由名跳转，false 表示使用Navigator跳转
        if (byName) {
          Navigator.pushNamed(context, routeName);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      child: Text(title),
    );
  }

  _item2(String title, page, String routeName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      transform: Matrix4.rotationZ(.2),
      width: 180,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange.shade700],
          ),
          // 渐变
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            // 阴影
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              // true 表示用路由名跳转，false 表示使用Navigator跳转
              if (byName) {
                Navigator.pushNamed(context, routeName);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => page),
                );
              }
            },
            child: Transform.scale(scale: 1.5, child: Text(title)),
          ),
        ),
      ),
    );
  }
}
