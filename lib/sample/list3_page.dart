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

class ListPage3 extends StatefulWidget {
  const ListPage3({super.key});

  @override
  State<StatefulWidget> createState() => _ListPage3State();
}

class _ListPage3State extends State<ListPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网格布局'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: GridView.count(crossAxisCount: 3, children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    return cityName.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 3, bottom: 2, right: 2, left: 3),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
