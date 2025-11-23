import 'package:dio/dio.dart';

abstract class FauliarError {
  final String errorMsg;

  FauliarError({required this.errorMsg});
}

class ServiceError extends FauliarError {
  ServiceError({required super.errorMsg});

  factory ServiceError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceError(errorMsg: "connection Timeout , please try again ");
      case DioExceptionType.sendTimeout:
        return ServiceError(errorMsg: "sendTimeout , please try again");
      case DioExceptionType.receiveTimeout:
        return ServiceError(errorMsg: "receiveTimeout , please try again");
      case DioExceptionType.badCertificate:
        return ServiceError(errorMsg: "badCertificate , please try again");
      case DioExceptionType.badResponse:
        return ServiceError.badResponse(
          dioError.response!.statusCode!,
          dioError.response!,
        );
      case DioExceptionType.cancel:
        return ServiceError(
          errorMsg: "Rquest was cancel , please try again later",
        );
      case DioExceptionType.connectionError:
        return ServiceError(errorMsg: "connectionError , please try again");

      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServiceError(errorMsg: "no internet connction");
        }
        return ServiceError(errorMsg: " Unexpcted error");
    }
  }

  factory ServiceError.badResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServiceError(errorMsg: response["error"]["message"]);
    } else if (status == 404) {
      return ServiceError(
        errorMsg: "Your request not found , please try again later",
      );
    } else if (status == 500) {
      return ServiceError(errorMsg: "Server error , please try again later ");
    } else {
      return ServiceError(errorMsg: "Something was an error");
    }
  }
}
