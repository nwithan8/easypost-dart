import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/parameters/parcels.dart';

/// The [ParcelService] handles parcels with the EasyPost API.
class ParcelService extends Service {
  ParcelService(Client client) : super(client);

  /// Creates a [Parcel].
  Future<Parcel> create(ParcelsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'parcels',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [Parcel].
  Future<Parcel> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'parcels/$id',
      ApiVersion.v2,
    );
  }
}
