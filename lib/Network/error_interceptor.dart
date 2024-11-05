import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectionTimeout:
        throw ConnectionTimeOutException(err.requestOptions);
      case DioErrorType.sendTimeout:
        throw SendTimeOutException(err.requestOptions);
      case DioErrorType.receiveTimeout:
        throw ReceiveTimeOutException(err.requestOptions);
      case DioErrorType.badResponse:
        print("STATUS CODE : ${err.response?.statusCode}");
        print("${err.response?.data}");
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        // Handle request cancellation
        break;
      case DioErrorType.unknown:
        print(err.message);
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        throw BadCertificateException(err.requestOptions);
      case DioErrorType.connectionError:
        throw ConnectionErrorException(err.requestOptions);
      default:
        throw UnknownDioErrorException(err.requestOptions, err.message);
    }
    return handler.next(err);
  }
}

class ConnectionTimeOutException extends DioError {
  ConnectionTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Connection Timed out, Please try again';
  }
}

class SendTimeOutException extends DioError {
  SendTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Send Timed out, Please try again';
  }
}

class ReceiveTimeOutException extends DioError {
  ReceiveTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Receive Timed out, Please try again';
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Internal server error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class BadCertificateException extends DioError {
  BadCertificateException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bad certificate detected. Please check your SSL certificate.';
  }
}

class ConnectionErrorException extends DioError {
  ConnectionErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'A connection error occurred, please check your network and try again.';
  }
}

class UnknownDioErrorException extends DioError {
  final String message;

  UnknownDioErrorException(RequestOptions r, String? msg)
      : message =
            msg ?? 'An unknown error occurred', // Provide a default message
        super(requestOptions: r);

  @override
  String toString() {
    return message; // Use the message directly
  }
}
