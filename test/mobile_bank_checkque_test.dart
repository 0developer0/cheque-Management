import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_bank_checkque/mobile_bank_checkque.dart';

void main() {
  const MethodChannel channel = MethodChannel('mobile_bank_checkque');

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
    expect(await MobileBankCheque.platformVersion, '42');
  });
}
