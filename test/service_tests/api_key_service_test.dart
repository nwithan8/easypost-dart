import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';

void main() {
  group('API keys', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('all', () async {
      Client client = TestUtils.setUpVCRClient("api_keys", 'all');
      client.enableProductionMode();

      final apiKeyCollection = await client.apiKeys.list();

      expect(apiKeyCollection, isNotNull);
      expect(apiKeyCollection.keys, isNotNull);
      for (ApiKey key in apiKeyCollection.keys!) {
        expect(key, isA<ApiKey>());
      }
    });
  });
}
