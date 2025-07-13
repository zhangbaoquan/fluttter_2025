package com.example.fluttter_2025

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity(){

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
//        BasicMessageChannelDemo(flutterEngine.dartExecutor.binaryMessenger)
        // 自定义插件
        flutterEngine.plugins.add(CofferPlugin())
    }
}
