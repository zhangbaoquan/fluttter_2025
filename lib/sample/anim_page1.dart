import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  : 补间动画
class AnimPage extends StatefulWidget {
  const AnimPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  AnimationStatus? animationStatus;
  double animationValue = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    // 补间动画
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    animation.addListener(() {
      // 动画值每次变动都会被调用，这里可以获取并更新动画的值
      setState(() {
        animationValue = animation.value;
      });
    });
    animation.addStatusListener((AnimationStatus status) {
      // 动画状态发生改变的时候被调用
      setState(() {
        animationStatus = status;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
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
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: ElevatedButton(
                onPressed: () {
                  controller.reset();
                  controller.forward();
                },
                child: Text('Start', textDirection: TextDirection.ltr),
              ),
            ),
            Text(
              'State : $animationStatus',
              textDirection: TextDirection.ltr,
            ),
            Text(
              'Value : $animationValue',
              textDirection: TextDirection.ltr,
            ),
            SizedBox(
              width: animation.value,
              height: animation.value,
              child: FlutterLogo(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
