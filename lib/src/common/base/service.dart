import 'package:easypost/src/common/client.dart';

/// Superclass for all services.
abstract class Service {
  final Client client;

  const Service(this.client);
}
