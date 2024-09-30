import 'exceptions.dart';

class PostApiBadRequestException extends PostApiException {
  PostApiBadRequestException({
    required super.code,
    required super.message,
    required super.endpoint,
  });
}
