abstract class PostApiException implements Exception {
  final int code;
  final String message;
  final String endpoint;

  PostApiException({
    required this.code,
    required this.message,
    required this.endpoint,
  });
}
