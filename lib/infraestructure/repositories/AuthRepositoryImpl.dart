import 'package:servinet_movil/domain/entities/user.dart';
import 'package:servinet_movil/domain/repository/UserRepository.dart';
import 'package:servinet_movil/infraestructure/client/api_client.dart';
import 'package:servinet_movil/infraestructure/dto/auth_dto.dart';
import 'package:servinet_movil/infraestructure/dto/user_dto.dart';

class AuthRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  AuthRepositoryImpl(this.apiClient);
  @override
  Future<User> login(AuthDto authDto) async {
    // final data = await apiClient.get('/users/$email');
    // final dto = UserDto.fromJson(data);
    // return dto.toEntity();
    final data = await apiClient.post('/auth', authDto.toJson());
  }
}
