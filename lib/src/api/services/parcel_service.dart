import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/parcels/create_parcel.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/parcel.dart';

/// The [ParcelService] handles parcels with the EasyPost API.
class ParcelService extends Service {
  ParcelService(Client client) : super(client);

  /// Creates a [Parcel].
  Future<Parcel> create(CreateParcel parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'parcels',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Parcel.fromJson(json);
  }

  /// Retrieves a [Parcel].
  Future<Parcel> retrieve(String parcelId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'parcels/$parcelId',
      ApiVersion.v2,
    );
    return Parcel.fromJson(json);
  }
}
