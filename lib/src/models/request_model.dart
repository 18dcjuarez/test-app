import 'package:flutter/material.dart';
import 'package:test_app_jun17/src/data/services/generic_service.dart';

class RequestModel {
  RequestModel({
    this.body,
    @required this.path,
    @required this.method,
    this.headers = const {},
    this.queryParams = const {},
  });

  final String? path;
  final dynamic body;
  final HTTPMethod? method;
  final Map<String, String> headers;
  final Map<String, String> queryParams;
}
