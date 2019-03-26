package com.wanjuanlink.lychee;

import android.app.Activity;
import android.app.Application;
import android.content.Context;

import com.taobao.idlefish.flutterboost.FlutterBoostPlugin;
import com.taobao.idlefish.flutterboost.interfaces.IPlatform;

import java.util.Map;

import io.flutter.app.FlutterApplication;
import com.wanjuanlink.lychee.loader.ServiceLoader;

public class MyApplication extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        ServiceLoader.load();

        FlutterBoostPlugin.init(new IPlatform() {
            @Override
            public Application getApplication() {
                return MyApplication.this;
            }

            /**
             * 获取应用入口的Activity,这个Activity在应用交互期间应该是一直在栈底的
             * @return
             */
            @Override
            public Activity getMainActivity() {
                return MainActivity.sRef.get();
            }

            @Override
            public boolean isDebug() {
                return true;
            }

            @Override
            public boolean startActivity(Context context, String url, int requestCode) {
                return PageRouter.openPageByUrl(context,url,requestCode);
            }

            @Override
            public Map getSettings() {
                return null;
            }
        });
    }
}