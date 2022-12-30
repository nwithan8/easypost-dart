import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/parameters/parcels.dart';

class ParcelService extends Service {
  ParcelService(Client client) : super(client);

  Future<Parcel> create(ParcelsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    return await client.requestJson(
      HttpMethod.post,
      'parcels',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Parcel> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'parcels/$id',
      ApiVersion.v2,
    );
  }
}
