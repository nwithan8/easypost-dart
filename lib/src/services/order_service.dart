import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/calculations/rates.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/order.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/parameters/orders.dart';

class OrderService extends Service {
  OrderService(Client client) : super(client);

  Future<Order> create(OrdersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(
        HttpMethod.post, 'orders', ApiVersion.v2,
        parameters: parameterMap);
    return Order.fromJson(json);
  }

  Future<Order> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'orders/$id', ApiVersion.v2);
    return Order.fromJson(json);
  }

  Future<Order> buy(Order order, OrdersBuy parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(
        HttpMethod.post, 'orders/${order.id}/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Order.fromJson(json);
  }

  Future<Order> refreshRates(Order order) async {
    final json = await client.requestJson(
        HttpMethod.get, 'orders/${order.id}/rates', ApiVersion.v2);
    return Order.fromJson(json);
  }

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
