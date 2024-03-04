import 'package:easypost/easypost.dart';
import 'package:test/test.dart';
import 'package:reflectable/reflectable.dart';
import 'package:easypost/src/constants.dart';

import 'fixtures.dart';
import 'test_utils.dart';
// import 'client_test.reflectable.dart';

void main() {
  group('Client', () {
    setUp(() {
      // Additional setup goes here.
      // initializeReflectable();
    });

    test('login with email and password', () async {
      TestVCR vcr = TestVCR(testCassettesFolder: "client");

      String email = loginEmail;
      String password = loginPassword;

      ClientConfiguration configuration = await ClientConfiguration.fromEmailAndPassword(email, password);

      expect(configuration, isNotNull);
    });
  });
}