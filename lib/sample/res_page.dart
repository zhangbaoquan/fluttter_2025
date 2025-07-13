import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class ResPage extends StatefulWidget {
  const ResPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用Flutter assets 资源'),
        leading: GestureDetector(
          onTap: () {
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
            Image(
                width: 300,
                height: 600,
                image: AssetImage('images/miku.jpg')
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}