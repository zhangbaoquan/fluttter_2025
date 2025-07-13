import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class AnimateBuilderPage extends StatefulWidget {
  const AnimateBuilderPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimateBuilderPageState();
}

class _AnimateBuilderPageState extends State<AnimateBuilderPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedWidget 动画 '),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: GrowTransition(animation: animation, child: FlutterLogo()),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  late Widget child;
  late Animation<double> animation;

  GrowTransition({super.key, required this.child, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => SizedBox(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}
