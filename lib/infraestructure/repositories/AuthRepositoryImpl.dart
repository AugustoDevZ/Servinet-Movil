import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/domain/exception/ResponseInvalidFormat.dart';
import 'package:servinet_movil/domain/repository/UserRepository.dart';
import 'package:servinet_movil/infraestructure/client/api_client.dart';
import 'package:servinet_movil/application/dto/auth_dto.dart';
import 'package:servinet_movil/infraestructure/dto/user_dto.dart';
import 'package:servinet_movil/infraestructure/load/load_data_app.dart';

class AuthRepositoryImpl implements UserRepository {
  final ApiClient apiClient = new ApiClient();

  @override
  Future<User> login(AuthDto authDto) async {
    final data = await apiClient.post('/auth', authDto.toJson());

    final accessToken = data['accessToken'];
    final refreshToken = data['refreshToken'];

    LoadDataApp.setTokenStorage(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );

    final dto = UserDto.fromJson(data['user']);

    return dto.toEntity();
  }

  @override
  Future<User> isActiveSession() async {
    final data = await apiClient.get('/auth');

    if (data == null) {
      throw RersponseInvalidFormat(
        "No se obtuvo el usuario de la api a pesar que tiene sesión activa",
      );
    }

    final dto = UserDto.fromJson(data['user']);

    return dto.toEntity();
  }

  @override
  Future<bool> logout() async {
    await apiClient.postLogot('/logout');
    LoadDataApp.resetTokenStorage();
    return true;
  }
}
