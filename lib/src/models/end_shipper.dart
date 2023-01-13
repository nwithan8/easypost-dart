import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/models.dart';
import 'package:easypost/src/utilities/conversions.dart';
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
      residential,
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
            residential,
            state,
            stateTaxId,
            street1,
            street2,
            verifications,
            zip,
            error);

  factory EndShipper.fromJson(Map<String, dynamic> input) =>
      _$EndShipperFromJson(input);

  Map<String, dynamic> toJson() => _$EndShipperToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EndShipperCollection extends Collection {
  @JsonKey(name: 'end_shippers')
  final List<EndShipper>? endShippers;

  EndShipperCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.endShippers)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory EndShipperCollection.fromJson(Map<String, dynamic> input) =>
      _$EndShipperCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$EndShipperCollectionToJson(this);
}
