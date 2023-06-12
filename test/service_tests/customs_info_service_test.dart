import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';

void main() {
  group('Customs Info', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("customs_info", 'create');
      client.enableTestMode();

      final params = Fixtures.basicCustomsInfo;

      final CustomsInfo customsInfo = await client.customsInfos.create(params);

      expect(customsInfo, isNotNull);
      expect(customsInfo, isA<CustomsInfo>());
      expect(customsInfo.id, startsWith("cstinfo_"));
      expect(customsInfo.eelPfc, "NOEEI 30.37(a)");
      for (CustomsItem item in customsInfo.customsItems!) {
        expect(item, isA<CustomsItem>());
      }
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("customs_info", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.basicCustomsInfo;

      final customsInfo = await client.customsInfos.create(params);

      final retrievedCustomsInfo =
          await client.customsInfos.retrieve(customsInfo.id!);

      expect(retrievedCustomsInfo, isNotNull);
      expect(retrievedCustomsInfo, isA<CustomsInfo>());
      expect(retrievedCustomsInfo.id == customsInfo.id, true);
    });
  });
}