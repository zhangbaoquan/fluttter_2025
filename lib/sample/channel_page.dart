import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class ChannelPage extends StatefulWidget {
  const ChannelPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  var channel = BasicMessageChannel(
    'com.flutter.guide.BasicMessageChannel',
    StandardMessageCodec(),
  );
  String netData = "";

  @override
  void initState() {
    channel.setMessageHandler((message) {
      debugPrint('haha_tag 消息 ： $message');
      Map map = message as LinkedHashMap<Object?, Object?>;
      setState(() {
        netData = map['speed'];
      });
      return Future.value('收到了');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('与原生页面相互通信'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: Text("当前网速 ： $netData"),
            ),
            Container(),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  sendMessage();
                },
                child: Text("将数据传给原生显示"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    final Map<Object?, Object?>? replyMap =
        await channel.send({'name': 'coffer', 'age': 18})
            as Map<Object?, Object?>?;
    debugPrint("haha_tag result");
    if (replyMap != null) {
      try {
        var name = replyMap["name"];
        var age = replyMap['age'];
        debugPrint("haha_tag flutter : name : $name , age : $age");
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
