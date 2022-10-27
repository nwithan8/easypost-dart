import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/calculations/rates.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/order.dart';
import 'package:easypost/src/common/models/rate.dart';

class OrderService extends Service {
  OrderService(Client client) : super(client);

  Future<Order> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'orders', ApiVersion.v2,
        parameters: data.wrap(['order']));
    return Order.fromJson(json);
  }

  Future<Order> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'orders/$id', ApiVersion.v2);
    return Order.fromJson(json);
  }

  Future<Order> buy(Order order, Rate rate) async {
    final json = await client.requestJson(
        HttpMethod.post, 'orders/${order.id}/buy', ApiVersion.v2,
        parameters: {'carrier': rate.carrier, 'service': rate.service});
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
