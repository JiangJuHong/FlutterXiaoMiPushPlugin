import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xiao_mi_push_plugin/xiao_mi_push_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('xiao_mi_push_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await XiaoMiPushPlugin.platformVersion, '42');
  });
}
