[\[中文文档\]](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin/blob/master/README-zh.md)
[\[English Docs\]](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin/blob/master/README.md)

# xiao_mi_push_plugin
[![pub package](https://img.shields.io/pub/v/xiao_mi_push_plugin.svg)](https://pub.dartlang.org/packages/xiao_mi_push_plugin)

小米推送SDK Flutter插件  
小米Push版本: v3.7.6  
测试时请使用真机测试，模拟器将会出现 `code = 10017, msg= 参数值非法` 异常

## 讨论群
<img
src="https://raw.githubusercontent.com/JiangJuHong/access-images/master/other/qq-group.jpg"
height="300em" style="max-width:100%;display: inline-block;"/>  
[点击加入群聊](https://jq.qq.com/?_wv=1027&k=QxCWMlUf)  

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
| getRegId  | 获取客户端的 RegId | -

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


## 其它插件
````
我同时维护的还有以下插件，如果您感兴趣与我一起进行维护，请通过Github联系我，欢迎 issues 和 PR。
````
| 平台     | 插件                                                                                      | 描述                      | 版本                                                                                                                                 |
|:--------|:------------------------------------------------------------------------------------------|:-------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| Flutter | [FlutterVideoPlayerLibrary-Desc](https://github.com/JiangJuHong/FlutterVideoPlayerLibrary-Desc) | Flutter 最好用的播放器(UI库) | - |
| Flutter | [FlutterPerfectVolumeControl](https://github.com/JiangJuHong/FlutterPerfectVolumeControl) | Flutter 完美的音量控制器插件 | [![pub package](https://img.shields.io/pub/v/perfect_volume_control.svg)](https://pub.dartlang.org/packages/perfect_volume_control) |
| Flutter | [FlutterTencentImPlugin](https://github.com/JiangJuHong/FlutterTencentImPlugin)           | 腾讯云IM插件               | [![pub package](https://img.shields.io/pub/v/tencent_im_plugin.svg)](https://pub.dartlang.org/packages/tencent_im_plugin)           |
| Flutter | [FlutterTencentRtcPlugin](https://github.com/JiangJuHong/FlutterTencentRtcPlugin)         | 腾讯云Rtc插件              | [![pub package](https://img.shields.io/pub/v/tencent_rtc_plugin.svg)](https://pub.dartlang.org/packages/tencent_rtc_plugin)         |
| Flutter | [FlutterXiaoMiPushPlugin](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin)         | 小米推送SDK插件            | [![pub package](https://img.shields.io/pub/v/xiao_mi_push_plugin.svg)](https://pub.dartlang.org/packages/xiao_mi_push_plugin)       |
| Flutter | [FlutterHuaWeiPushPlugin](https://github.com/JiangJuHong/FlutterHuaWeiPushPlugin)         | 华为推送(HMS Push)插件     | [![pub package](https://img.shields.io/pub/v/hua_wei_push_plugin.svg)](https://pub.dartlang.org/packages/hua_wei_push_plugin)       |
| Flutter | [FlutterTextSpanField](https://github.com/JiangJuHong/FlutterTextSpanField)               | 自定义文本样式输入框         | [![pub package](https://img.shields.io/pub/v/text_span_field.svg)](https://pub.dartlang.org/packages/text_span_field)               |
| Flutter | [FlutterClipboardListener](https://github.com/JiangJuHong/FlutterClipboardListener)       | 粘贴板监听器               | [![pub package](https://img.shields.io/pub/v/clipboard_listener.svg)](https://pub.dartlang.org/packages/clipboard_listener)         |
| Flutter | [FlutterQiniucloudLivePlugin](https://github.com/JiangJuHong/FlutterQiniucloudLivePlugin) | Flutter 七牛云直播云插件    | 暂未发布，通过 git 集成                                                                                                                            |
