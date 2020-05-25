import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:xiao_mi_push_plugin/entity/mi_push_message_entity.dart';

import 'entity/mi_push_command_message_entity.dart';

/// 监听器对象
class XiaoMiPushPluginListener {
  /// 监听器列表
  static Set<ListenerValue> listeners = Set();

  XiaoMiPushPluginListener(MethodChannel channel) {
    // 绑定监听器
    channel.setMethodCallHandler((methodCall) async {
      // 解析参数
      Map<dynamic, dynamic> arguments = methodCall.arguments;

      switch (methodCall.method) {
        case 'onListener':
          // 获得原始类型和参数
          String typeStr = arguments['type'].toString();
          var params = arguments['params'] != null
              ? jsonDecode(arguments["params"])
              : null;

          // 封装回调类型和参数
          XiaoMiPushListenerTypeEnum type;

          // 初始化类型
          for (var item in XiaoMiPushListenerTypeEnum.values) {
            var es = item.toString().split(".");
            if (es[es.length - 1] == typeStr) {
              type = item;
              break;
            }
          }

          // 没有找到类型就返回
          if (type == null) {
            throw MissingPluginException();
          }

          // 回调触发
          switch (type) {
            case XiaoMiPushListenerTypeEnum.RequirePermissions:
              break;
            case XiaoMiPushListenerTypeEnum.NotificationMessageClicked:
              params = MiPushMessageEntity.fromJson(params);
              break;
            case XiaoMiPushListenerTypeEnum.ReceivePassThroughMessage:
              params = MiPushMessageEntity.fromJson(params);
              break;
            case XiaoMiPushListenerTypeEnum.CommandResult:
              params = MiPushCommandMessageEntity.fromJson(params);
              break;
            case XiaoMiPushListenerTypeEnum.ReceiveRegisterResult:
              params = MiPushCommandMessageEntity.fromJson(params);
              break;
            case XiaoMiPushListenerTypeEnum.NotificationMessageArrived:
              params = MiPushMessageEntity.fromJson(params);
              break;
          }

          for (var item in listeners) {
            item(type, params);
          }

          break;
        default:
          throw MissingPluginException();
      }
    });
  }

  /// 添加消息监听
  void addListener(ListenerValue func) {
    listeners.add(func);
  }

  /// 移除消息监听
  void removeListener(ListenerValue func) {
    listeners.remove(func);
  }
}

/// 监听器值模型
typedef ListenerValue<P> = void Function(
    XiaoMiPushListenerTypeEnum type, P params);

/// 监听器类型枚举
enum XiaoMiPushListenerTypeEnum {
  NotificationMessageClicked,
  RequirePermissions,
  ReceivePassThroughMessage,
  CommandResult,
  ReceiveRegisterResult,
  NotificationMessageArrived,
}
