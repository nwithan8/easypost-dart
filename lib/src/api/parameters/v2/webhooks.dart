import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class WebhooksUpdate extends Update {
  @JsonParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @JsonParameter(Necessity.optional, ['url'])
  String? url;

  WebhooksUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class WebhooksCreate extends Create {
  @JsonParameter(Necessity.optional, ['webhook_secret'])
  String? secret;

  @JsonParameter(Necessity.required, ['url'])
  String? url;

  WebhooksCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class WebhooksAll extends All {
  WebhooksAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}
