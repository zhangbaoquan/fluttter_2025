import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class DrawerPage extends StatefulWidget {
  final appTitle = '侧拉 Demo';

  const DrawerPage({super.key});

  @override
  State<StatefulWidget> createState() => _DrawerPageState(title: appTitle);
}

class _DrawerPageState extends State<StatefulWidget> {
  final String title;
  _DrawerPageState({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.share))
        ],
      ),
      body: const Center(child: Text('侧拉 Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // 收起侧拉
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // 收起侧拉
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}