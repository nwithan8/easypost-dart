import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'api_key_service_test.reflectable.dart';

void main() {
  group('API keys', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
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

    test('retrieve api keys for user', () async {
      Client client = TestUtils.setUpVCRClient("api_keys", 'retrieve_api_keys_for_user');
      client.enableProductionMode();

      final user = await client.users.retrieveMe();
      
      final apiKeyCollection = await client.apiKeys.retrieveApiKeysForUser(user.id!);

      expect(apiKeyCollection, isNotNull);
      expect(apiKeyCollection, isA<List<ApiKey>>());
    });
  });
}
