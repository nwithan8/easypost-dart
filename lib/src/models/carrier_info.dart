import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/carrier_info_carrier.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfo extends Model {
  @JsonKey(name: 'carriers')
  final List<CarrierInfoCarrier>? carriers;

  CarrierInfo(objectType, mode, this.carriers) : super(objectType, mode);

  factory CarrierInfo.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierInfoToJson(this);
}
