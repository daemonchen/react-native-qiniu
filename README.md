# react-native-qiniu
react native qiniu

### useage:

add `QiniuManager.h` & `QiniuManager.m` to your project, and then in your react-native code use it like this:


```
    import React, { NativeModules } from 'react-native'

    var QiniuManager = NativeModules.QiniuManager;

    QiniuManager.uploadToQiniu(uri,key,token,params,function(result){
            if (!result) {
                console.log('上传图片失败，请稍后再试');
                return;
            };
            // self.alert('上传图片成功');
            callback(result);
        });
```

author: 503802922 [scott chen](http://www.classical1988.com/)

mail: cgyqqcgy@gmail.com
