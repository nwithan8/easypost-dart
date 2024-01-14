import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateBrand extends Parameters {
  @JsonParameter(Necessity.optional, ['brand', 'ad'])
  String? adBase64;

  @JsonParameter(Necessity.optional, ['brand', 'ad_href'])
  String? adUrl;

  @JsonParameter(Necessity.optional, ['brand', 'background_color'])
  String? backgroundColorHexCode;

  @JsonParameter(Necessity.optional, ['brand', 'color'])
  String? colorHexCode;

  @JsonParameter(Necessity.optional, ['brand', 'logo'])
  String? logoBase64;

  @JsonParameter(Necessity.optional, ['brand', 'logo_href'])
  String? logoUrl;

  @JsonParameter(Necessity.optional, ['brand', 'theme'])
  String? theme;

  UpdateBrand() : super();
}
