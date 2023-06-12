import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateWebhook extends Parameters {
  @JsonParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @JsonParameter(Necessity.optional, ['url'])
  String? url;

  UpdateWebhook()
      : super();
}
