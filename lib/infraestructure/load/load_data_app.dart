import 'package:servinet_movil/domain/entities/token_storage.dart';

class LoadDataApp {
  static final String baseUrl =
      'http://192.168.1.5:2026/zadints/servinet-movil';

  static final TokenStorage _tokenStorage = new TokenStorage();

  static TokenStorage getTokenStorage() {
    return _tokenStorage;
  }

  static Future<void> resetTokenStorage() async {
    await _tokenStorage.clear();
  }

  static Future<void> setTokenStorage({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _tokenStorage.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  static Future<String?> getAccessToken() async {
    return _tokenStorage.getAccessToken();
  }

  static Future<String?> getRefreshToken() async {
    return _tokenStorage.getRefreshToken();
  }
}
