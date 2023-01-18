import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/tools/rates.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/models/order.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/api/parameters/orders.dart';

/// The [OrderService] handles orders with the EasyPost API.
class OrderService extends Service {
  OrderService(Client client) : super(client);

  /// Creates an [Order].
  Future<Order> create(OrdersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
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
  Future<Order> buy(Order order, OrdersBuy parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'orders/${order.id}/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Order.fromJson(json);
  }

  /// Refreshes the [Rate]s for an [Order].
  Future<Order> refreshRates(Order order) async {
    final json = await client.requestJson(
        HttpMethod.get, 'orders/${order.id}/rates', ApiVersion.v2);
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
      throw Exception('Order has no rates');
    }
    return getLowestRate(order.rates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }
}
