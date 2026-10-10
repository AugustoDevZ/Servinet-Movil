import 'package:servinet_movil/application/dto/order_accepted.dart';
import 'package:servinet_movil/application/dto/order_dto.dart';
import 'package:servinet_movil/domain/entities/user.dart';

abstract interface class OrdersRepository {
  Future<List<OrderDto>> getAllOrders();
  Future<bool> postAcceptOrder(OrderAcceptedDto orderAcceptedDto);
  Future<User> postCancelOrder();
  Future<User> postFinishOrder();
  Future<User> getOrder();
}
