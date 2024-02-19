import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parcel.g.dart';

@JsonSerializable(explicitToJson: true)
class Parcel extends ReadOnlyModelWithId implements IParcelParameter {
  @JsonKey(name: 'height')
  final double? height;

  @JsonKey(name: 'length')
  final double? length;

  @JsonKey(name: 'predefined_package')
  final String? predefinedPackage;

  @JsonKey(name: 'weight')
  final double? weight;

  @JsonKey(name: 'width')
  final double? width;

  Parcel(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.height,
    this.length,
    this.predefinedPackage,
    this.weight,
    this.width,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Parcel.fromJson(Map<String, dynamic> input) =>
      _$ParcelFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ParcelToJson(this);
}
