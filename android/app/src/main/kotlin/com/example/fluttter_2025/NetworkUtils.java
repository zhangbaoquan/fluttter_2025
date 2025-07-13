package com.example.fluttter_2025;

import android.net.TrafficStats;

/**
 * author       : coffer
 * date         : 2024/10/22
 * description  :
 */

public class NetworkUtils {

    public static long getTxBytes() {
        return TrafficStats.getTotalTxBytes();  // 获取总发送字节数
    }

    public static long getRxBytes() {
        return TrafficStats.getTotalRxBytes();  // 获取总接收字节数
    }

    public static long getUidTxBytes(int uid) {
        return TrafficStats.getUidTxBytes(uid);  // 获取指定UID的发送字节数
    }

    public static long getUidRxBytes(int uid) {
        return TrafficStats.getUidRxBytes(uid);  // 获取指定UID的接收字节数
    }
}
