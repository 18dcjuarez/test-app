// ignore_for_file: avoid_dynamic_calls,implicit_dynamic_map_literal,constant_identifier_names, lines_longer_than_80_chars

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:test_app_jun17/src/models/request_model.dart';
import 'package:test_app_jun17/src/models/response_model.dart';

enum HTTPMethod { GET, POST, PATCH, DELETE, PUT }

class GenericService extends SimpleService {
  GenericService._interal();

  static final GenericService _instance = GenericService._interal();
  static GenericService get instance => _instance;
}

class SimpleService {
  final _client = Dio(
    BaseOptions(
      baseUrl: '${dotenv.env['BASE_URL']}',
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 10000),
      contentType: 'application/json',
    ),
  );

  Function getMethodCall(HTTPMethod method) {
    switch (method) {
      case HTTPMethod.POST:
        return _client.post;
      case HTTPMethod.GET:
        return _client.get;
      case HTTPMethod.DELETE:
        return _client.delete;
      case HTTPMethod.PATCH:
        return _client.patch;
      case HTTPMethod.PUT:
        return _client.put;
    }
  }

  Future<ResponseModel> get(
    String path, {
    required Map<String, String> headers,
    required Map<String, String> queryParams,
  }) {
    return sendRequest(
      RequestModel(
        path: path,
        headers: headers,
        method: HTTPMethod.GET,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel> post(
    String path, {
    required Map<String, dynamic> body,
    required Map<String, String> headers,
    required Map<String, String> queryParams,
  }) {
    FormData formData = FormData.fromMap(body);
    return sendRequest(
      RequestModel(
        body: formData,
        path: path,
        headers: headers,
        method: HTTPMethod.POST,
        queryParams: queryParams,
      ),
    );
  }

  Future<ResponseModel> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) {
    return sendRequest(
      RequestModel(
        path: path,
        headers: headers!,
        queryParams: queryParams!,
        method: HTTPMethod.DELETE,
      ),
    );
  }

  Future<ResponseModel> patch(
    String path, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) {
    return sendRequest(
      RequestModel(
        body: body,
        path: path,
        headers: headers!,
        method: HTTPMethod.PATCH,
        queryParams: queryParams!,
      ),
    );
  }

  Future<ResponseModel> put(
    String path, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, String>? queryParams,
  }) {
    return sendRequest(
      RequestModel(
        body: body,
        path: path,
        headers: headers!,
        method: HTTPMethod.PUT,
        queryParams: queryParams!,
      ),
    );
  }

  Future<ResponseModel> sendRequest(RequestModel req) async {
    try {
      final headers = <String, dynamic>{};
      headers.addAll(req.headers);
      final methodClient = getMethodCall(req.method!);
      Response res;
      if (req.body != null) {
        res = await methodClient(
          req.path,
          data: req.body,
          queryParameters: req.queryParams,
          options: Options(headers: headers),
        ) as Response<dynamic>;
      } else {
        res = await methodClient(
          req.path,
          queryParameters: req.queryParams,
          options: Options(headers: headers),
        ) as Response<dynamic>;
      }

      return ResponseModel(
        message: res.statusMessage!,
        statusCode: res.statusCode!,
        success: res.statusCode! >= 200 && res.statusCode! <= 299,
        data: res.data is String &&
                res.data.toString().contains('{') &&
                res.data.toString().contains('}')
            ? json.decode(res.data.toString())
            : res.data,
      );
    } on DioException catch (exception) {
      return ResponseModel(
        data: null,
        success: false,
        statusCode: exception.response!.statusCode!,
        message:
            exception.response!.data != null && exception.response!.data is Map
                ? '${exception.response!.data['message']}'
                : exception.response!.data.toString(),
      );
    } catch (exception) {
      return ResponseModel(
        data: null,
        success: false,
        message: exception.toString(),
      );
    }
  }
}
