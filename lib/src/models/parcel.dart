import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parcel.g.dart';

@JsonSerializable(explicitToJson: true)
class Parcel extends Model {
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

  Map<String, dynamic> toJson() => _$ParcelToJson(this);
}
