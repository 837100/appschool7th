import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login Test Group', () {
    FlutterDriver? driver;

    // 테스트 준비 작업: FlutterDriver를 연결합니다.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // 테스트 종료 작업: FlutterDriver 연결을 종료합니다.
    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    // 첫 번째 테스트: 위젯들이 화면에 존재하는지 확인합니다.
    test('exist widget check', () async {
      // Arrange: 테스트에 사용할 위젯들을 찾습니다.
      final testUsername = find.byValueKey('testUsername');
      final testPassword = find.byValueKey('testPassword');
      final testLoginButton = find.byValueKey('testLoginButton');

      // Assert: 각 위젯들의 텍스트가 올바른지 확인합니다.
      expect(await driver!.getText(testUsername), 'Username');
      expect(await driver!.getText(testPassword), 'Password');
      expect(await driver!.getText(testLoginButton), 'Login');

      await driver!.waitFor(testUsername);
      await driver!.waitFor(testPassword);
      await driver!.waitFor(testLoginButton);


    });

    // 두 번째 테스트: 로그인 동작을 테스트합니다.
    test('should allow login', () async {
      // Arrange: 테스트에 사용할 위젯들을 찾습니다.
      final testUsername = find.byValueKey('testUsername');
      final testPassword = find.byValueKey('testPassword');
      final testLoginButton = find.byValueKey('testLoginButton');

      // Act: 사용자 이름과 비밀번호를 입력하고 로그인 버튼을 탭합니다.
      await driver!.tap(testUsername);
      await driver!.enterText('username');
      await driver!.tap(testPassword);
      await driver!.enterText('password');
      await driver!.tap(testLoginButton);

      // Assert: 'Logging in' 텍스트가 화면에 표시되는지 확인합니다.
      await driver!.waitFor(find.text('Logging in'));
    });
  });
}
