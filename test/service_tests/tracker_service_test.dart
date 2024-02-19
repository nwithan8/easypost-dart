import 'package:easypost/easypost.dart';
import 'package:easypost/src/constants.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'tracker_service_test.reflectable.dart';

void main() {
  group('Trackers', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("trackers", 'create');
      client.enableTestMode();

      final params = Fixtures.basicTracker;

      final tracker = await client.trackers.create(params);

      expect(tracker, isNotNull);
      expect(tracker, isA<Tracker>());
      expect(tracker.status, "pre_transit");
      expect(tracker.trackingCode, params.trackingCode);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("trackers", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.basicTracker;

      final tracker = await client.trackers.create(params);

      final retrieved = await client.trackers.retrieve(tracker.id);

      expect(retrieved, isNotNull);
      expect(retrieved, isA<Tracker>());
      expect(retrieved.id, tracker.id);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("trackers", 'list');
      client.enableTestMode();

      final params = ListTrackers();
      params.pageSize = 1;

      final trackerCollection = await client.trackers.list(parameters: params);

      expect(trackerCollection, isNotNull);
      expect(trackerCollection, isA<TrackerCollection>());
      expect(trackerCollection.trackers!.length > 0, true);
      expect(
          trackerCollection.trackers![0].id, startsWith(ModelPrefixes.tracker));
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("trackers", 'get_next_page');
      client.enableTestMode();

      final params = ListTrackers();

      final trackerCollection = await client.trackers.list(parameters: params);

      try {
        // Test the next page if it exists
        final nextPage = await client.trackers.getNextPage(trackerCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<TrackerCollection>());
        expect(nextPage.trackers!.length > 0, true);
        expect(nextPage.trackers![0].id, startsWith(ModelPrefixes.tracker));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }
    });
  });
}
