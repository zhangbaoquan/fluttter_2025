import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class PluginUse extends StatefulWidget {
  const PluginUse({super.key});


  @override
  State<StatefulWidget> createState() => _PluginUseState();
}

class _PluginUseState extends State<PluginUse> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用Plugin插件设置颜色'),
        leading: GestureDetector(
          onTap: (){
            // 返回上个页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: ColorUtil.color('#12b7f5')),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
