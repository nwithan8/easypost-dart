import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class WebhooksUpdate extends Update {
  @RequestParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @RequestParameter(Necessity.optional, ['url'])
  String? url;

  WebhooksUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class WebhooksCreate extends Create {
  @RequestParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @RequestParameter(Necessity.required, ['url'])
  String? url;

  WebhooksCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class WebhooksAll extends All {
  WebhooksAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}
