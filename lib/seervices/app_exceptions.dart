


class AppExseption implements Exception {
  final String message;
  final String prefix;
  final String url;

  AppExseption(this.message, this.prefix, this.url);
}

class BadRequestException extends AppExseption {
  BadRequestException(String message, String url)
      : super(message, 'Bad Request', url);
}
class FatctdataException extends AppExseption {
 FatctdataException(String message, String url)
      : super(message, 'Uneble process', url);
}
class ApiNoRespondException extends AppExseption {
      ApiNoRespondException(String message, String url)
  : super(message, 'Uneble process', url);
  }

class UnAuthorizedException extends AppExseption {
UnAuthorizedException(String message, String url)
      : super(message, 'unauthor ', url);
}
class OthersException extends AppExseption {
  OthersException(String message, String url)
      : super(message, 'others no', url);
}