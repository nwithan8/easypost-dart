import 'package:easypost/src/api/parameters/v2/end_shippers/list_end_shippers.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'end_shipper.g.dart';

@JsonSerializable(explicitToJson: true)
class EndShipper extends Address {
  EndShipper(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      carrierFacility,
      city,
      company,
      country,
      email,
      federalTaxId,
      message,
      name,
      phone,
      isResidential,
      state,
      stateTaxId,
      street1,
      street2,
      verifications,
      zip,
      error)
      : super(
            id,
            createdAt,
            updatedAt,
            objectType,
            mode,
            carrierFacility,
            city,
            company,
            country,
            email,
            federalTaxId,
            message,
            name,
            phone,
            isResidential,
            state,
            stateTaxId,
            street1,
            street2,
            verifications,
            zip,
            error);

  factory EndShipper.fromJson(Map<String, dynamic> input) =>
      _$EndShipperFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$EndShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EndShipperCollection
    extends PaginatedCollection<EndShipper, ListEndShippers> {
  @JsonKey(name: 'end_shippers')
  final List<EndShipper>? endShippers;

  EndShipperCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.endShippers)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory EndShipperCollection.fromJson(Map<String, dynamic> input) =>
      _$EndShipperCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$EndShipperCollectionToJson(this);
}
