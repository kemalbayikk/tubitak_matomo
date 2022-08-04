import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shop_app/main.dart' as app;
void main() {
  group("App Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Full App Test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final continueButton = find.byType(TextButton).first;
      final emailFormField = find.byType(TextField).first;
      final passwordFormField = find.byType(TextField).last;


      await tester.tap(continueButton);
      await tester.pumpAndSettle();

      await tester.enterText(emailFormField, "kemalbayikk@gmail.com");
      await tester.enterText(passwordFormField, "123456789");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final loginButton = find.byType(TextButton).first;
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 10));

      final advertisementButton = find.byKey(Key("advertisement"));
      await tester.tap(advertisementButton);
      await tester.tap(advertisementButton);
      await tester.tap(advertisementButton);
      await tester.tap(advertisementButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 10));

      final cartButton = find.byKey(Key("cart"));
      await tester.tap(cartButton);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 10));

    });

  });
}