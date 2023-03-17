[\[中文文档\]](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin/blob/master/README-zh.md)
[\[English Docs\]](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin/blob/master/README.md)

# xiao_mi_push_plugin
[![pub package](https://img.shields.io/pub/v/xiao_mi_push_plugin.svg)](https://pub.dartlang.org/packages/xiao_mi_push_plugin)

Xiaomi Push SDK Flutter plugin
Xiaomi Push version: v3.7.6
During testing, please use a real device as an emulator may trigger an exception with the message "code = 10017, msg= Illegal parameter value".

## Discussion Group
<img
src="https://raw.githubusercontent.com/JiangJuHong/access-images/master/other/qq-group.jpg"
height="300em" style="max-width:100%;display: inline-block;"/>  
[Click to join the group chat](https://jq.qq.com/?_wv=1027&k=QxCWMlUf)  

## Requirements
Flutter Version >= 1.12  

If you encounter an error with code `22022`, please make sure that push services are enabled. For instructions on how to enable push services, please refer to: [https://support.rongcloud.cn/ks/NzE5](https://support.rongcloud.cn/ks/NzE5)

## Configuration
### Obfuscation
No additional configuration is required as obfuscation is already built in.

### Permissions
Modify the `AndroidManifest.xml` file and add the following:
````
<permission android:name="your.package.name.permission.MIPUSH_RECEIVE"
            android:protectionLevel="signature"/>
<uses-permission android:name="your.package.name.permission.MIPUSH_RECEIVE"/>
````

## Usage
### API
|  API   | Description  | Parameters  | 
|  ----  | ----  | ----  |
| init  | Initialize | { appId: APP_ID , appKey: APP_KEY }
| setAlias  | Set alias | { alias: alias, category: category }
| unsetAlias  | Cancel alias | { alias: alias, category: category }
| getAllAlias  | Get all aliases | -
| setUserAccount  | Set user account | { userAccount: account, category: category }
| unsetUserAccount  | Cancel user account | { userAccount: account, category: category }
| getAllUserAccount  | Get all user accounts | -
| subscribe  | Set tag | { topic: topic, category: category }
| unsubscribe  | Cancel tag | { topic: topic, category: category }
| getAllTopic  | Get all tags | -
| getRegId  | Get client RegId | -

### Listeners
Add listener: `XiaoMiPushPlugin.addListener`, remove listener: `XiaoMiPushPlugin.removeListener`  
Listener method prototype: `typedef ListenerValue<P> = void Function(XiaoMiPushListenerTypeEnum type, P params);`

|  Type   | Description  | Format  | 
|  ----  | ----  | ----  |
| NotificationMessageClicked  | Receive notification messages pushed by the server and trigger when the user clicks | MiPushMessageEntity
| RequirePermissions  | Callback when the required permissions are not obtained | List<String>
| ReceivePassThroughMessage  | Receive pass-through messages pushed by the server | MiPushMessageEntity
| CommandResult  | Get the result of the command sent to the server | MiPushCommandMessageEntity
| ReceiveRegisterResult  | Get the result of the registration command sent to the server | MiPushCommandMessageEntity
| NotificationMessageArrived  | Receive notification messages pushed by the server, trigger when the message arrives at the client, and also receive notification messages that do not pop up when the application is in the foreground (on MIUI, only when the application is in a running state or on the self-starting whitelist can this method be used to receive such messages). ｜ MiPushMessageEntity ｜

## Other Plugins
I also maintain the following plugins. If you are interested in maintaining them with me, please contact me through Github. Issues and PRs are welcome.


| Platform | Plugin                                                                                      | Description                 | Version                                                                                                                                 |
|:--------|:------------------------------------------------------------------------------------------|:-------------------------|:------------------------------------------------------------------------------------------------------------------------------------|
| Flutter | [FlutterVideoPlayerLibrary-Desc](https://github.com/JiangJuHong/FlutterVideoPlayerLibrary-Desc) | The best player (UI library) for Flutter | - |
| Flutter | [FlutterPerfectVolumeControl](https://github.com/JiangJuHong/FlutterPerfectVolumeControl) | Flutter's perfect volume controller plugin | [![pub package](https://img.shields.io/pub/v/perfect_volume_control.svg)](https://pub.dartlang.org/packages/perfect_volume_control) |
| Flutter | [FlutterTencentImPlugin](https://github.com/JiangJuHong/FlutterTencentImPlugin)           | Tencent Cloud IM plugin               | [![pub package](https://img.shields.io/pub/v/tencent_im_plugin.svg)](https://pub.dartlang.org/packages/tencent_im_plugin)           |
| Flutter | [FlutterTencentRtcPlugin](https://github.com/JiangJuHong/FlutterTencentRtcPlugin)         | Tencent Cloud Rtc plugin              | [![pub package](https://img.shields.io/pub/v/tencent_rtc_plugin.svg)](https://pub.dartlang.org/packages/tencent_rtc_plugin)         |
| Flutter | [FlutterXiaoMiPushPlugin](https://github.com/JiangJuHong/FlutterXiaoMiPushPlugin)         | Xiaomi Push SDK plugin            | [![pub package](https://img.shields.io/pub/v/xiao_mi_push_plugin.svg)](https://pub.dartlang.org/packages/xiao_mi_push_plugin)       |
| Flutter | [FlutterHuaWeiPushPlugin](https://github.com/JiangJuHong/FlutterHuaWeiPushPlugin)         | Huawei Push (HMS Push) plugin     | [![pub package](https://img.shields.io/pub/v/hua_wei_push_plugin.svg)](https://pub.dartlang.org/packages/hua_wei_push_plugin)       |
| Flutter | [FlutterTextSpanField](https://github.com/JiangJuHong/FlutterTextSpanField)               | Custom text style input box         | [![pub package](https://img.shields.io/pub/v/text_span_field.svg)](https://pub.dartlang.org/packages/text_span_field)               |
| Flutter | [FlutterClipboardListener](https://github.com/JiangJuHong/FlutterClipboardListener)       | Clipboard listener               | [![pub package](https://img.shields.io/pub/v/clipboard_listener.svg)](https://pub.dartlang.org/packages/clipboard_listener)         |
| Flutter | [FlutterQiniucloudLivePlugin](https://github.com/JiangJuHong/FlutterQiniucloudLivePlugin) | Flutter Qiniu Cloud Live plugin    | Not

