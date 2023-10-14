import 'package:task_tech/utils/exports.dart';

class DioClient {
  final InternetInfo _internetInfo = InternetInfoImpl();
  final String _devBaseURL = "https://task-teck.onrender.com/";

  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      logInfo(options.uri.toString());
      logInfo(options.headers.toString());
      logInfo(options.data.toString());
      return handler.next(options);
    }, onResponse: (response, handler) {
      logSuccess("RESPONSE_CODE ${response.statusCode}");
      logSuccess("RESPONSE_DATA ${response.data}");
      logSuccess('----------------------------------------------------------');
      return handler.next(response);
    }, onError: (response, handler) {
      logError(response.requestOptions.uri.toString());
      logError(response.type.name);
      logError(response.response?.statusCode?.toString() ?? "No Status Code");
      logError(response.requestOptions.data?.toString() ?? "No Body");
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
        return response;
      } on DioException catch (error) {
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
    bool useFormData = false,
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
    _dio.options.headers['Content-Type'] = useFormData
        ? Headers.formUrlEncodedContentType
        : Headers.jsonContentType;
    if (interNetaAvailale) {
      try {
        Response response = await _dio.post(fullURL ?? url, data: body);
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }

        return response;
      } on DioException catch (error) {
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
    bool useFormData = false,
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
    _dio.options.headers['content-Type'] = useFormData
        ? Headers.formUrlEncodedContentType
        : Headers.jsonContentType;
    if (interNetaAvailale) {
      try {
        Response response = await _dio.patch(fullURL ?? url, data: body);
        if (isLoading) {
          Constants.hideLoadingOrNavBack();
        }

        return response;
      } on DioException catch (error) {
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
      } on DioException catch (error) {
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

  //? Data will be sent to the server
  FormData formDataFunc(Map<String, dynamic> map) => FormData.fromMap(map);

  //? The file will be sent to the server inside the form data
  Future<MultipartFile> fileToUploadFunc(String path, String filename) async =>
      await MultipartFile.fromFile(path, filename: filename);
}


// final formData = FormData.fromMap({
//   'name': 'dio',
//   'date': DateTime.now().toIso8601String(),
//   'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
//   'files': [
//     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
//     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
//   ]
// });
// final response = await dio.post('/info', data: formData);