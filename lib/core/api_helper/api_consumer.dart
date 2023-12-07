abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters, required bool sendToken});

  Future<dynamic> post(
    String path, {
    required dynamic body,
    required bool sendToken,
  });
}
