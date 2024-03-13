import 'package:easypost/easypost.dart';
import 'package:test/test.dart';
import 'package:reflectable/reflectable.dart';
import 'package:easypost/src/constants.dart';

import 'fixtures.dart';
import 'test_utils.dart';
import 'client_test.reflectable.dart';

void main() {
  group('Client', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('login with email and password', () async {
      TestVCR vcr = TestVCR(testCassettesFolder: "client");

      String email = loginEmail;
      String password = loginPassword;

      ClientConfiguration configuration =
          await ClientConfiguration.fromEmailAndPassword(email, password);

      expect(configuration, isNotNull);
    });

    test('trigger pre-flight and post-flight hooks', () async {
      int preFlightCallbackCount = 0;
      int postFlightCallbackCount = 0;

      final hooks = Hooks();
      hooks.addPreFlightCallback((PreFlightCallbackData data) async {
        preFlightCallbackCount++;
      });
      hooks.addPostFlightCallback((PostFlightCallbackData data) async {
        postFlightCallbackCount++;
      });

      Client client =
          TestUtils.setUpVCRClient("client", 'hooks', hooks: hooks);
      client.enableTestMode();

      final params = ListAddresses();
      params.pageSize = 1;

      final _ = await client.addresses.list(parameters: params);

      expect(preFlightCallbackCount, 1);
      expect(postFlightCallbackCount, 1);
    });
  });
}
