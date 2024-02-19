import 'package:easypost/easypost.dart';
import 'package:easypost/src/constants.dart';
import 'package:reflectable/reflectable.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'service_test.reflectable.dart';

List<MockRequest> mockRequests() {
  return [
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.get,
        resourceRegex: r'addresses$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        content: '{"addresses": [], "has_more": false}',
      ),
    ),
  ];
}

void main() {
  group('Services', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("services", 'get_next_page');
      client.enableTestMode();

      final params = ListAddresses();
      params.pageSize = 3;

      AddressCollection addressCollection =
          await client.addresses.list(parameters: params);
      String firstId = addressCollection.addresses!.first.id;

      for (var i = 0; i < 3; i++) {
        if (!addressCollection.hasMore!) {
          break;
        }

        addressCollection =
            await client.addresses.getNextPage(addressCollection);

        // If the first ID in the next page is the same as the first ID in the previous page, then we didn't get the next page properly
        expect(addressCollection.addresses!.first.id, isNot(firstId));

        firstId = addressCollection.addresses!.first.id;
      }

      expect(addressCollection, isNotNull);

      final nextPage =
          await client.addresses.getNextPage(addressCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });

    test('get next page with size limit', () async {
      Client client =
          TestUtils.setUpVCRClient("services", 'get_next_page_with_size_limit');
      client.enableTestMode();

      final params = ListAddresses();
      params.pageSize = 1;

      AddressCollection addressCollection =
          await client.addresses.list(parameters: params);

      expect(addressCollection.addresses!.length, params.pageSize);

      params.pageSize = 3;

      addressCollection = await client.addresses.list(parameters: params);

      expect(addressCollection.addresses!.length, params.pageSize);
    });

    test('get next page reach end', () async {
      Client client =
          TestUtils.setUpVCRClient("services", 'get_next_page_reach_end');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      final params = ListAddresses();
      params.pageSize = 3;

      AddressCollection addressCollection =
          await mockClient.addresses.list(parameters: params);

      bool hitEnd = false;

      while (!hitEnd) {
        try {
          addressCollection =
              await mockClient.addresses.getNextPage(addressCollection);
        } on PaginationException catch (e) {
          hitEnd = true;
        }
      }

      expect(hitEnd, isTrue);
    });
  });
}
