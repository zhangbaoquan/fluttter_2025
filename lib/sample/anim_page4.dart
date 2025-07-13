import 'package:flutter/material.dart';

/// author       : coffer
/// date         : 2025/7/13
/// description  :
class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero动画'),
        leading: GestureDetector(
          onTap: () {
            // 返回上个页面
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: PhotoHero(
        photo:
            'http://www.devio.org/img/avatar.png',
        width: 300.0,
        onTap: () {
          // 执行页面跳转
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Flippers Page'),
                    leading: GestureDetector(
                      onTap: () {
                        // 返回上个页面
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  body: PhotoHero(
                    photo:
                        'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg',
                    width: 300.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    key: null,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({
    super.key,
    required this.photo,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo, //tag：[必须]用于关联两个Hero动画的标识；
        child: Material(
          // child：[必须]定义动画所呈现的widget；
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(photo, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
