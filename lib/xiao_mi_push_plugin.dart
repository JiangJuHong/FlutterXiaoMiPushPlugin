import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:xiao_mi_push_plugin/xiao_mi_push_plugin_listener.dart';

class XiaoMiPushPlugin {
  static const MethodChannel _channel = const MethodChannel('xiao_mi_push_plugin');
  static XiaoMiPushPluginListener listener;

  /// 初始化，如果没有appId或appKey，请登录小米开发者中心申请
  /// [appId] 应用appId
  /// [appKey] 应用appKey
  static Future<void> init({
    @required String appId,
    @required String appKey,
  }) async {
    return await _channel.invokeMethod('init', {
      "appId": appId,
      "appKey": appKey,
    });
  }

  /// 设置别名
  /// [alias] 别名
  /// [category] 分类
  static Future<void> setAlias({
    @required String alias,
    @required String category,
  }) async {
    return await _channel.invokeMethod('setAlias', {
      "alias": alias,
      "category": category,
    });
  }

  /// 撤销别名
  /// [alias] 别名
  /// [category] 分类
  static Future<void> unsetAlias({
    @required String alias,
    @required String category,
  }) async {
    return await _channel.invokeMethod('unsetAlias', {
      "alias": alias,
      "category": category,
    });
  }

  /// 获得所有别名
  static Future<List<String>> getAllAlias() async {
    return (await _channel.invokeMethod('getAllAlias')).cast<String>();
  }

  /// 设置用户账户
  /// [userAccount] 用户账户
  /// [category] 分类
  static Future<void> setUserAccount({
    @required String userAccount,
    @required String category,
  }) async {
    return await _channel.invokeMethod('setUserAccount', {
      "userAccount": userAccount,
      "category": category,
    });
  }

  /// 撤销设置用户账户
  /// [userAccount] 用户账户
  /// [category] 分类
  static Future<void> unsetUserAccount({
    @required String userAccount,
    @required String category,
  }) async {
    return await _channel.invokeMethod('unsetUserAccount', {
      "userAccount": userAccount,
      "category": category,
    });
  }

  /// 获得所有用户账户
  static Future<List<String>> getAllUserAccount() async {
    return (await _channel.invokeMethod('getAllUserAccount')).cast<String>();
  }

  /// 设置标签
  /// [topic] 标签
  /// [category] 分类
  static Future<void> subscribe({
    @required String topic,
    @required String category,
  }) async {
    return await _channel.invokeMethod('subscribe', {
      "topic": topic,
      "category": category,
    });
  }

  /// 撤销设置标签
  /// [topic] 标签
  /// [category] 分类
  static Future<void> unsubscribe({
    @required String topic,
    @required String category,
  }) async {
    return await _channel.invokeMethod('unsubscribe', {
      "topic": topic,
      "category": category,
    });
  }

  /// 获得所有标签
  static Future<List<String>> getAllTopic() async {
    return (await _channel.invokeMethod('getAllTopic')).cast<String>();
  }

  /// 添加消息监听
  static void addListener(ListenerValue func) {
    if (listener == null) {
      listener = XiaoMiPushPluginListener(_channel);
    }
    listener.addListener(func);
  }

  /// 移除消息监听
  static void removeListener(ListenerValue func) {
    if (listener == null) {
      listener = XiaoMiPushPluginListener(_channel);
    }
    listener.removeListener(func);
  }
}
