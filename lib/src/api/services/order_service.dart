import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/orders/buy_order.dart';
import 'package:easypost/src/api/parameters/v2/orders/create_order.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
import 'package:easypost/src/models/order.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/tools/rates.dart';

/// The [OrderService] handles orders with the EasyPost API.
class OrderService extends Service {
  OrderService(Client client) : super(client);

  /// Creates an [Order].
  Future<Order> create(CreateOrder parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'orders', ApiVersion.v2,
        parameters: parameterMap);
    return Order.fromJson(json);
  }

  /// Retrieves an [Order].
  Future<Order> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'orders/$id', ApiVersion.v2);
    return Order.fromJson(json);
  }

  /// Purchases an [Order].
  Future<Order> buy(Order order, BuyOrder parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'orders/${order.id}/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Order.fromJson(json);
  }

  /// Refreshes the [Rate]s for an [Order].
  Future<Order> refreshRates(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'orders/$id/rates', ApiVersion.v2);
    return Order.fromJson(json);
  }

  /// Calculates the lowest [Rate] for an [Order].
  Rate getLowestRateFor(
    Order order, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    if (order.rates == null) {
      throw MissingPropertyException.generate(order.toString(), 'rates');
    }
    return getLowestRateInternal(order.rates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }
}
