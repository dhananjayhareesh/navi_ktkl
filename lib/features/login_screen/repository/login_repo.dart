import 'package:navitask/services/api_constants.dart';
import 'package:navitask/services/network_adapter.dart';

class AuthenticationRepo {
  static Future<Map<String, dynamic>> login(Map payload) async {
    late Map<String, dynamic> response;
    await BaseClient.shared.safeApiCall(
      ApiConstants.login,
      RequestType.post,
      includeAuth: false,
      data: payload,
      onSuccess: (s) {
        response = s.rawResponse;
      },
      onError: (s) {
        s.fold(
          (ld) {
            throw ld;
          },
          (r) {
            throw r;
          },
        );
      },
    );
    return response;
  }
}
