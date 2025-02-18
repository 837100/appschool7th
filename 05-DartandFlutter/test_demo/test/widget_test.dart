// 이 파일은 기본적인 Flutter 위젯 테스트를 포함하고 있습니다.
// WidgetTester 유틸리티를 사용하여 위젯과 상호작용할 수 있습니다.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_demo/main.dart';

void main() {
  group('Login Test Group', () {
    // 첫 번째 테스트: 로그인 위젯들이 화면에 존재하는지 확인합니다.
    testWidgets('should allow login', (WidgetTester testWorker) async {
      // Arrange: 테스트에 사용할 위젯들을 찾습니다.
      final testUsername = find.byKey(const ValueKey('testUsername'));
      final testPassword = find.byKey(const ValueKey('testPassword'));
      final testLoginButton = find.byKey(const ValueKey('testLoginButton'));

      // Act: MyApp 위젯을 화면에 그립니다.
      await testWorker.pumpWidget(const MyApp());

      // Assert: 각 위젯들이 화면에 존재하는지 확인합니다.
      expect(testUsername, findsOneWidget);
      expect(testPassword, findsOneWidget);
      expect(testLoginButton, findsOneWidget);
    });

    // 두 번째 테스트: 로그인 동작을 테스트합니다.
    testWidgets('should allow login', (WidgetTester testWorker) async {
      // Arrange: 테스트에 사용할 위젯들을 찾습니다.
      final testUsername = find.byKey(const ValueKey('testUsername'));
      final testPassword = find.byKey(const ValueKey('testPassword'));
      final testLoginButton = find.byKey(const ValueKey('testLoginButton'));

      // Act: MyApp 위젯을 화면에 그립니다.
      await testWorker.pumpWidget(const MyApp());

      // 사용자 이름과 비밀번호를 입력합니다.
      await testWorker.enterText(testUsername, 'username');
      await testWorker.enterText(testPassword, 'password');

      // 로그인 버튼을 탭합니다.
      await testWorker.tap(testLoginButton);

      // 화면을 다시 그립니다.
      await testWorker.pump();

      // Assert: 'Logging in...' 텍스트가 화면에 표시되는지 확인합니다.
      expect(find.text('Logging in...'), findsOneWidget);
    });
  });
}
