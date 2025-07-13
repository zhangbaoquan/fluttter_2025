package com.example.fluttter_2025

import android.os.Handler
import android.os.Handler.Callback
import android.os.Looper
import android.os.Message
import android.util.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec

/**
 * author       : coffer
 * date         : 2025/7/13
 * description  :
 */

class CofferPlugin : FlutterPlugin, Callback {
    private var channel: BasicMessageChannel<Any>? = null
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupChannel(binding.binaryMessenger)
        val handler = Handler(Looper. myLooper()!!,this)
        //创建NetSpeedTimer实例
//        val mNetSpeedTimer = NetSpeedTimer(binding.applicationContext,
//        NetSpeed(), handler).setDelayTime(1000).setPeriodTime(2000)
//        //在想要开始执行的地方调用该段代码
//        mNetSpeedTimer.startSpeedTimer()
        // 方式二
        NetSpeedUtils.startMeasuringNetSpeed()
        NetSpeedUtils.netSpeedCallback = object : NetSpeedUtils.NetSpeedCallback {
            override fun onNetSpeedChange(downloadSpeed: String, uploadSpeed: String) {
                handler.post {
                    Log.i("haha_tag", "current downloadSpeed net speed  = $downloadSpeed")
                    Log.i("haha_tag", "current uploadSpeed net speed  = $downloadSpeed")
                    val map = mapOf("speed" to downloadSpeed)
                    channel?.send(map
                    ) { reply -> Log.i("haha_tag", "收到Flutter 消息了 ： $reply") }
                }
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMessageHandler(null)
        channel = null
    }

    private fun setupChannel(messenger: BinaryMessenger) {
        channel = BasicMessageChannel(
            messenger,
            "com.flutter.guide.BasicMessageChannel",
            StandardMessageCodec()
        )
        channel?.setMessageHandler { message, reply ->
            val name = (message as Map<*, *>)["name"]
            val age = message["age"]

            val map = mapOf(
                "name" to "hello,$name",
                "age" to "$age"
            )
            Log.i("haha_tag", "新的插件开发")
            Log.i("haha_tag", "name : $name , age : $age")

            reply.reply(map)
        }
    }

    override fun handleMessage(msg: Message): Boolean {
        when (msg.what) {
            NetSpeedTimer.NET_SPEED_TIMER_DEFAULT -> {
                val speed = msg.obj
                //打印你所需要的网速值，单位默认为kb/s
                Log.i("haha_tag", "current net speed  = $speed")
                val map = mapOf("speed" to speed)
                channel?.send(map
                ) { reply -> Log.i("haha_tag", "收到Flutter 消息了 ： $reply") }
            }
        }
        return false
    }
}