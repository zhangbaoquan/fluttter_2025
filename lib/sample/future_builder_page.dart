import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
/// author       : coffer
/// date         : 2025/7/13
/// description  :
class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({super.key});

  @override
  State<StatefulWidget> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  String showResult = '';

  // 注意这里的Url 里的写法，需要去掉前面的http 或者 https，后面的path 要和 host 分开
  var url = Uri.https(
    'www.devio.org',
    '/io/flutter_app/json/test_common_model.json',
  );

  Future<CommonModel> fetchGet() async {
    final response = await http.get(url);
    Utf8Decoder utf8decoder = Utf8Decoder(); //fix 中文乱码
    final result = convert.json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder 练习'),
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
            FutureBuilder(future: fetchGet(), builder: (BuildContext context,
                AsyncSnapshot<CommonModel> snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return const Text('Input a URL to start');
                case ConnectionState.waiting:
                // 网络请求中，这里显示一个进度条
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Text('active');
                case ConnectionState.done:
                // done 表示网络请求完成
                  if(snapshot.hasError){
                    // 网络请求失败
                    return Text(
                      '${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    // 网络请求成功
                    return Column(children: <Widget>[
                      Text('icon:${snapshot.data?.icon}'),
                      Text('statusBarColor:${snapshot.data?.statusBarColor}'),
                      Text('title:${snapshot.data?.title}'),
                      Text('url:${snapshot.data?.url}')
                    ]);
                  }
              }
            })
          ],
        ),
      ),
    );
  }


}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({required this.icon,
    required this.title,
    required this.url,
    required this.statusBarColor,
    required this.hideAppBar});

  /// 注意这里的map 里的value 用的是dynamic 动态类型
  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}