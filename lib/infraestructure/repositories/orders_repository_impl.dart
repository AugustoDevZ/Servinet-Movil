import 'package:flutter/material.dart';
import 'package:servinet_movil/application/dto/order_dto.dart';
import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/domain/exception/ResponseInvalidFormat.dart';
import 'package:servinet_movil/domain/repository/orders_repository.dart';
import 'package:servinet_movil/infraestructure/client/api_client.dart';
import 'package:servinet_movil/application/dto/auth_dto.dart';
import 'package:servinet_movil/infraestructure/dto/user_dto.dart';
import 'package:servinet_movil/infraestructure/load/load_data_app.dart';

class OrderRepositoryImpl implements OrdersRepository {
  final ApiClient apiClient = new ApiClient();
  @override
  Future<List<OrderDto>> getAllOrders() async{
    final data = await apiClient.get('/orders');
    
    return (data as List)
      .map(
        (item) => OrderDto.fromJson(
          Map<String, dynamic>.from(item as Map),
        ),
      )
      .toList();
  }

  
  @override
  Future<bool> postAcceptOrder(OrderAcceptedDto orderAcceptedDto) async {
    final data = await apiClient.post('/auth', authDto.toJson());
  }
  @override
  Future<User> postCancelOrder() async {}
  final data = await apiClient.post('/auth', authDto.toJson());
  @override
  Future<User> postFinishOrder() async {
    final data = await apiClient.post('/auth', authDto.toJson());
  }
  @override
  Future<User> getOrder() async {
    final data = await apiClient.post('/auth', authDto.toJson());
  }

  
}
