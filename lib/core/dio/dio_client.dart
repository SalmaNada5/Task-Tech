import 'package:dio/dio.dart';
import 'package:task_tech/constants/consts.dart';
import 'package:task_tech/core/dio/error_model.dart';
import 'package:task_tech/core/internet/internet_info.dart';

import '../errors/logger.dart';

class DioClient {
  final InternetInfo _internetInfo = InternetInfoImpl();
  final String _devBaseURL = "https://task-teck.onrender.com/";

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10), // 10 seconds
      receiveTimeout: const Duration(seconds: 10), // 10 seconds
    ),
  )..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      logInfo(options.uri.toString());
      logInfo(options.headers.toString());
      logInfo(options.data.toString()); // BODY
      return handler.next(options);
    }, onResponse: (response, handler) {
      logSuccess("RESPONSE_CODE ${response.statusCode}");
      logSuccess("RESPONSE_DATA ${response.data}");
      logSuccess('----------------------------------------------------------');
      return handler.next(response);
    }, onError: (response, handler) {
      logError(response.error.toString());
      logError("error.response.data ${response.response?.data}");
      logError('----------------------------------------------------------');
      return handler.next(response);
    }));

  String? _errorFunc(error) {
    ErrorModel err = ErrorModel.fromJson(error.response?.data);
    Constants.errorMessage(description: err.message);
    return err.message;
  }

  Future<Object?> get(
    String api,
    String? token, {
    String? fullURL,
    bool isLoading = true,
  }) async {
    var url = _devBaseURL + api;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (token != "" && token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (interNetaAvailale) {
      try {
        Response response = await _dio.get(
          fullURL ?? url,
        );
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        //response.data = response.body
        return response;
      } on Error catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _errorFunc(error);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack();
      }
      Constants.errorMessage(description: "No internet connection");
      return "No internet connection";
    }
  }

  Future<Object?> post(
    String api,
    String? token, {
    required var body,
    String? fullURL,
    bool isLoading = true,
  }) async {
    var url = _devBaseURL + api;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (token != "" && token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    _dio.options.headers['content-Type'] = Headers.jsonContentType;
    if (interNetaAvailale) {
      try {
        Response response = await _dio.post(fullURL ?? url, data: body);
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }

        return response;
      } on Error catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _errorFunc(error);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack();
      }
      Constants.errorMessage(description: "No internet connection");
      return "No internet connection";
    }
  }

  Future<Object?> patch(
    String api,
    String? token, {
    required var body,
    String? fullURL,
    bool isLoading = true,
  }) async {
    var url = _devBaseURL + api;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (token != "" && token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    _dio.options.headers['content-Type'] = Headers.jsonContentType;
    if (interNetaAvailale) {
      try {
        Response response = await _dio.patch(fullURL ?? url, data: body);
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }

        return response;
      } on Error catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _errorFunc(error);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack();
      }
      Constants.errorMessage(description: "No internet connection");
      return "No internet connection";
    }
  }

  Future<Object?> put(
    String api,
    String? token, {
    required var body,
    String? fullURL,
    bool isLoading = true,
  }) async {
    var url = _devBaseURL + api;
    bool interNetaAvailale = await _internetInfo.isConnected;
    if (isLoading) {
      Constants.showLoading();
    }
    if (token != "" && token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    _dio.options.headers['content-Type'] = Headers.jsonContentType;
    if (interNetaAvailale) {
      try {
        Response response = await _dio.put(fullURL ?? url, data: body);
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }

        return response;
      } on Error catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }
        return _errorFunc(error);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack();
      }
      Constants.errorMessage(description: "No internet connection");
      return "No internet connection";
    }
  }
}
