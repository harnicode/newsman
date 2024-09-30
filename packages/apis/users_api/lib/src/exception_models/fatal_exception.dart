import 'exceptions.dart';

class PostApiFatalException extends PostApiException {
  PostApiFatalException({
    required super.code,
    required super.message,
    required super.endpoint,
  });
}
