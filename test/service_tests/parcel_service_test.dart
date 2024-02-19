import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'parcel_service_test.reflectable.dart';

void main() {
  group('Parcels', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("parcels", 'create');
      client.enableTestMode();

      final params = Fixtures.basicParcel;

      final parcel = await client.parcels.create(params);

      expect(parcel, isNotNull);
      expect(parcel, isA<Parcel>());
      expect(parcel.id, startsWith(ModelPrefixes.parcel));
      expect(parcel.weight, params.weight);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("parcels", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.basicParcel;

      final parcel = await client.parcels.create(params);

      final retrievedParcel = await client.parcels.retrieve(parcel.id);

      expect(retrievedParcel, isNotNull);
      expect(retrievedParcel, isA<Parcel>());
      expect(retrievedParcel.id == parcel.id, true);
    });
  });
}
