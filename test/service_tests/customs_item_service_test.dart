import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'customs_item_service_test.reflectable.dart';

void main() {
  group('Customs Item', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("customs_items", 'create');
      client.enableTestMode();

      final params = Fixtures.basicCustomsItem;

      final CustomsItem customsItem = await client.customsItems.create(params);

      expect(customsItem, isNotNull);
      expect(customsItem, isA<CustomsItem>());
      expect(customsItem.id, startsWith("cstitem_"));
      expect(customsItem.value, params.value.toString());
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("customs_items", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.basicCustomsItem;

      final customsItem = await client.customsItems.create(params);

      final retrievedCustomsItem =
          await client.customsItems.retrieve(customsItem.id);

      expect(retrievedCustomsItem, isNotNull);
      expect(retrievedCustomsItem, isA<CustomsItem>());
      expect(retrievedCustomsItem.id == customsItem.id, true);
    });
  });
}
