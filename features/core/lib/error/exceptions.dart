
class NotFoundException implements Exception {
  const NotFoundException();
}

class InternetException implements Exception {
  const InternetException();
}

class UnauthorizedException implements Exception {
  const UnauthorizedException();
}

class InternalServerException implements Exception {
  InternalServerException(this.message);
  final String? message;
}

class BadRequestException implements Exception {
  BadRequestException(this.message);
  final String? message;
}

class OtherException implements Exception {
  const OtherException();
}
