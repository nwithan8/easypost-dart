import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateWebhook extends Parameters {
  @JsonParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @JsonParameter(Necessity.required, ['url'])
  String? url;

  CreateWebhook() : super();
}
