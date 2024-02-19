import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'event_service_test.reflectable.dart';

void main() {
  group('Events', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("events", 'list');
      client.enableTestMode();

      final params = ListEvents();
      params.pageSize = Fixtures.pageSize;

      final eventCollection = await client.events.list(parameters: params);

      expect(eventCollection, isNotNull);
      expect(eventCollection.events, isNotNull);
      expect(eventCollection.events!.length <= Fixtures.pageSize, true);
      for (Event event in eventCollection.events!) {
        expect(event, isA<Event>());
      }
    });

    test('next page', () async {
      Client client = TestUtils.setUpVCRClient("events", 'next_page');
      client.enableTestMode();

      final params = ListEvents();
      params.pageSize = 1;

      final eventCollection = await client.events.list(parameters: params);

      expect(eventCollection, isNotNull);

      final nextPage =
          await client.events.getNextPage(eventCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });
  });
}
