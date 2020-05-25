# xiao_mi_push_plugin
[![pub package](https://img.shields.io/pub/v/xiao_mi_push_plugin.svg)](https://pub.dartlang.org/packages/xiao_mi_push_plugin)

小米推送SDK Flutter插件  
小米Push版本: v3.7.6  
测试时请使用真机测试，模拟器将会出现 `code = 10017, msg= 参数值非法` 异常

## 使用要求
Flutter Version >= 1.12  

如果出现 `22022` 错误，请确保已启用推送服务，启用步骤参考: [https://support.rongcloud.cn/ks/NzE5](https://support.rongcloud.cn/ks/NzE5)

## 配置
### 混淆
无需额外配置，已内部打入混淆

### 权限
修改 `AndroidManifest.xml` 文件，增加
````
    <permission android:name="你的包名.permission.MIPUSH_RECEIVE"
                android:protectionLevel="signature"/>
    <uses-permission android:name="你的包名.permission.MIPUSH_RECEIVE"/>
````

## 使用
### 接口
|  接口   | 说明  | 参数  | 
|  ----  | ----  | ----  |
| init  | 初始化 | { appId: APP_ID , appKey: APP_KEY }
| setAlias  | 设置别名 | { alias: 别名, category: 分类 }
| unsetAlias  | 撤销别名 | { alias: 别名, category: 分类 }
| getAllAlias  | 获得所有别名 | -
| setUserAccount  | 设置用户账户 | { userAccount: 账户, category: 分类 }
| unsetUserAccount  | 撤销设置用户账户 | { userAccount: 账户, category: 分类 }
| getAllUserAccount  | 获得所有账户 | -
| subscribe  | 设置标签 | { topic: 标签, category: 分类 }
| unsubscribe  | 撤销设置标签 | { topic: 标签, category: 分类 }
| getAllTopic  | 获得所有标签 | -

### 监听器
添加监听器:`XiaoMiPushPlugin.addListener`，移除监听器:`XiaoMiPushPlugin.removeListener`  
监听器方法原形: `typedef ListenerValue<P> = void Function(XiaoMiPushListenerTypeEnum type, P params);`

|  类型   | 说明  | 格式  | 
|  ----  | ----  | ----  |
| NotificationMessageClicked  | 接收服务器推送的通知消息，用户点击后触发 | MiPushMessageEntity
| RequirePermissions  | 当所需要的权限未获取到的时候会回调该接口 | List<String>
| ReceivePassThroughMessage  | 接收服务器推送的透传消息 | MiPushMessageEntity
| CommandResult  | 获取给服务器发送命令的结果 | MiPushCommandMessageEntity
| ReceiveRegisterResult  | 获取给服务器发送注册命令的结果 | MiPushCommandMessageEntity
| NotificationMessageArrived  | 接收服务器推送的通知消息，消息到达客户端时触发，还可以接受应用在前台时不弹出通知的通知消息(在MIUI上，只有应用处于启动状态，或者自启动白名单中，才可以通过此方法接受到该消息) | MiPushMessageEntity