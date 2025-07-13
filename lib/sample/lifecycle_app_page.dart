import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/12
/// description  :
class AppLifecyclePage extends StatefulWidget{
  const AppLifecyclePage({super.key});

  @override
  State<StatefulWidget> createState() => _AppLifecyclePageState();

}

class _AppLifecyclePageState extends State<AppLifecyclePage> with WidgetsBindingObserver{

  @override
  void initState() {
    debugPrint('AppLifecyclePage initState ');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('应用生命周期学习'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Text('Flutter应用生命周期学习'),
    );
  }

  /// 应用生命周期变化时，会回调该方法
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint('AppLifecyclePage state : $state ');
    if(state == AppLifecycleState.paused){
      debugPrint('应用在后台');
    } else if(state == AppLifecycleState.resumed){
      debugPrint('应用在前台');
    }else if(state == AppLifecycleState.inactive){
      // 不常用，应用处于非活跃状态下，并且未接收用户输入时调用，比如：来个电话
    }else if(state == AppLifecycleState.detached){
      debugPrint('AppLifecyclePage 应用detached');
    }
  }

  @override
  void dispose() {
    debugPrint('AppLifecyclePage dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}