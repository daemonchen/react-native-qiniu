# react-native-qiniu
react native qiniu

```
    var {
        NativeModules
    } = React

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
