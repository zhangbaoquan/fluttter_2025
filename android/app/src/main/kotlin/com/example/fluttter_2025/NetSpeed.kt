package com.example.fluttter_2025

import android.net.TrafficStats

/**
 * author       : coffer
 * date         : 2025/7/13
 * description  :
 */

class NetSpeed {
    val TAG: String = NetSpeed::class.java.simpleName
    private var lastTotalRxBytes: Long = 0
    private var lastTimeStamp: Long = 0

    fun getNetSpeed(uid: Int): String {
        val nowTotalRxBytes = getTotalRxBytes(uid)
        val nowTimeStamp = System.currentTimeMillis()
        val speed =
            ((nowTotalRxBytes - lastTotalRxBytes) * 1000 / (nowTimeStamp - lastTimeStamp)) //毫秒转换
        lastTimeStamp = nowTimeStamp
        lastTotalRxBytes = nowTotalRxBytes
        return "$speed kb/s"
    }

    fun getTotalRxBytes(uid: Int): Long {
        return if (TrafficStats.getUidRxBytes(uid) == TrafficStats.UNSUPPORTED.toLong()) 0 else (TrafficStats.getTotalRxBytes() / 1024) //转为KB
    }
}