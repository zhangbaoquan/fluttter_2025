import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class ListPage4 extends StatefulWidget {
  const ListPage4({super.key});

  @override
  State<StatefulWidget> createState() => _ListPage4State();
}

class _ListPage4State extends State<ListPage4> {
  List<String> cityName = [
    '北京',
    '上海',
    '广州',
    '深圳',
    '杭州',
    '苏州',
    '成都',
    '武汉',
    '郑州',
    '洛阳',
    '厦门',
    '青岛',
    '拉萨',
  ];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      // 下面的意思是滑动到最底部的时候触发
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  _loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 下面是 拷贝city_name 数据到新的list 中
      List<String> list = List<String>.from(cityName);
      list.addAll(cityName);
      cityName = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉刷新，上拉更多'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(controller: _controller, children: _buildList()),
        ),
      ),
    );
  }

  // 这里的Null 表示返回类型为Null
  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // 下拉时，将数据翻转
      cityName = cityName.reversed.toList();
    });
  }

  List<Widget> _buildList() {
    return cityName.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
