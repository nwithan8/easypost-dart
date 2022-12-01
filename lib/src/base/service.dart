import 'package:easypost/src/client.dart';

/// Superclass for all services.
abstract class Service {
  final Client client;

  const Service(this.client);
}
