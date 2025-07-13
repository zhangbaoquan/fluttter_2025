import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class GesturePage extends StatefulWidget {
  const GesturePage({super.key});

  @override
  State<StatefulWidget> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';

  // 下面分别是小球运行的轨迹位置
  double moveX = 0, moveY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('手势处理及点击事件'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => _printMsg('点击'),
                  onDoubleTap: () => _printMsg('双击'),
                  onLongPress: () => _printMsg('长按'),
                  onTapCancel: () => _printMsg('取消'),
                  onTapUp: (e) => _printMsg('松开'),
                  onTapDown: (e) => _printMsg('按下'),
                  child: Container(
                    padding: EdgeInsets.all(60),
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: const Text(
                      '点我',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  ),
                ),
                Text(printString)
              ],
            ),
            Positioned(
              // 跟随手指滑动的小球
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _dMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += ',$msg';
    });
    // _launchUrl();
  }

  final Uri _url = Uri.parse('https://flutter.dev');
  Future<void> _launchUrl() async{
    if(!await launchUrl(_url)){
      throw 'Could not launch $_url';
    }
  }

  _dMove(DragUpdateDetails e) {
    setState(() {
      moveY += e.delta.dy;
      moveX += e.delta.dx;
    });
  }

}