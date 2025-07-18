import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/12
/// description  :
class WidgetLifecyclePage extends StatefulWidget{
  const WidgetLifecyclePage({super.key});

  @override
  State<StatefulWidget> createState() => _WidgetLifecyclePageState();

}

class _WidgetLifecyclePageState extends State<WidgetLifecyclePage>{

  int _count = 0;

  /// 这是创建Widget时调用的除构造方法外的第一个方法：
  /// 类似于Android中的 onCreate 与 IOS中的viewDidLoad()
  /// 在这个方法中通常会做一些初始化的操作，比如channel的初始化，监听器的初始化等
  @override
  void initState() {
    debugPrint('--- initState ---');
    super.initState();
  }

  /// 当依赖的State对象改变时调用
  /// a. 在第一次构建Widget时，在initState（）之后立即调用此方法；
  /// b. 如果StatefulWidget 依赖于InheritedWidget，那么当当前State所依赖InheritedWidget中的变量改变时会再次调用它
  /// 拓展：InheritedWidget可以高效的将数据在Widget树中向下传递、共享。
  @override
  void didChangeDependencies() {
    debugPrint('--- didChangeDependencies ---');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组件生命周期学习'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _count++;
                    });
                  },
                  child: Text(
                    '点我',
                    style: TextStyle(fontSize: 26),
                  )),
              Text(_count.toString())
            ],
          ),
        ),
      ), // Thi
    );
  }

  /// 这不是一个常用到的生命周期方法，当父组件需要重新绘制的时候才会调用
  /// 该方法会携带一个oldWidget参数，可以将其与当前的Widget进行对比以便执行一些额外的逻辑，如
  /// if(oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget(covariant WidgetLifecyclePage oldWidget) {
    debugPrint('--- didUpdateWidget ---');
    super.didUpdateWidget(oldWidget);
  }

  /// 很少使用，在组件被移除时调用，在dispose 之前调用
  @override
  void deactivate() {
    debugPrint('--- deactivate ---');
    super.deactivate();
  }

  /// 常用，组件被销毁时调用
  /// 通常在该方法中执行一些资源释放工作，比如：监听器的卸载，channel的销毁等
  @override
  void dispose() {
    debugPrint('--- dispose ---');
    super.dispose();
  }

}