import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
const List<String> cityName = [
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

class ListPage1 extends StatefulWidget {
  const ListPage1({super.key});

  @override
  State<StatefulWidget> createState() => _ListPage1State();
}

class _ListPage1State extends State<ListPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('列表1'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(children: _buildList()),
    );
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
}
