package com.example.fluttter_2025

import android.app.Application
import android.content.Context

/**
 * author       : coffer
 * date         : 2025/7/13
 * description  :
 */

open class CofferApplication : Application() {

    companion object {
        const val TAG = "CofferApplication_tag"
        var mInstance: CofferApplication? = null

        fun getInstance(): CofferApplication? {
            return mInstance
        }
    }

    override fun onCreate() {
        super.onCreate()
    }

    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        mInstance = this
    }
}