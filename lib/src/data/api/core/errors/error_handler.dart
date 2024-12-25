import 'package:dio/dio.dart';
import '../constants/statues_codes.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorHandler {
  final String errorMassage;
  final int? code;
  ErrorHandler({required this.errorMassage, this.code});

  static ErrorHandler fromException(Exception exception, AppLocalizations locale) {
    if (exception is DioException) {
      return _handleDioException(exception,locale);
    } else {
      return ErrorHandler(errorMassage: locale.unknown);
    }
  }

  static ErrorHandler _handleDioException(DioException exception, AppLocalizations locale) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorHandler(errorMassage: locale.connectionError);
      case DioExceptionType.badCertificate:
        return ErrorHandler(errorMassage: locale.badCertificate);
      case DioExceptionType.badResponse:
        return ErrorHandler._formResponse(exception.response!,locale);
      case DioExceptionType.connectionError:
        return ErrorHandler(errorMassage: locale.connectionError);
      default:
        return ErrorHandler(errorMassage: locale.unknown);
    }
  }

  static ErrorHandler _formResponse(Response<dynamic> response , AppLocalizations locale) {
    switch (response.statusCode) {
      case StatuesCodes.unauthorized:
      case StatuesCodes.forbidden:
        return ErrorHandler(errorMassage: response.data["error"], code: 401);
      case StatuesCodes.conflict:
        return ErrorHandler(
            errorMassage:
            response.data["error"] ?? locale.conflict, code: 409);
      case StatuesCodes.notFount:
        return ErrorHandler(errorMassage: locale.notFount);
      case StatuesCodes.internalServerError:
        return ErrorHandler(
            errorMassage: locale.internalServerError);
      default:
        return ErrorHandler(errorMassage: locale.unknown);
    }
  }
}
