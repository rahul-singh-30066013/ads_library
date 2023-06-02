import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String logName = 'AD REST API';
String baseUrl = '';
const int width = 90;

class AdLogger extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;

  AdLogger({
    this.request = true,
    this.requestHeader = true,
    this.requestBody = true,
    this.responseHeader = true,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = width,
    this.compact = true,
    this.logPrint = print,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    baseUrl = options.baseUrl;
    if (requestHeader) {
      _logRequestResponseHeader(
        '${options.baseUrl}${options.path}',
        requestResponse: 'Request Url',
      );
      _logRequestResponseHeader(
        options.queryParameters,
        requestResponse: 'Query Parameters',
      );
      final Map<String, dynamic> requestHeaders = <String, dynamic>{}
        ..addAll(options.headers);
      requestHeaders['contentType'] = options.contentType?.toString();
      requestHeaders['responseType'] = options.responseType.toString();
      requestHeaders['followRedirects'] = options.followRedirects;
      requestHeaders['connectTimeout'] = options.connectTimeout;
      requestHeaders['receiveTimeout'] = options.receiveTimeout;
      _logRequestResponseHeader(requestHeaders, requestResponse: 'Headers');
      _logRequestResponseHeader(options.extra, requestResponse: 'Extras');
    }
    if (requestBody && options.method != 'GET') {
      final Object? data = options.data;
      if (data == null) {
        super.onRequest(options, handler);
        return;
      }

      if (data is FormData) {
        final Map<String, Object> formDataMap = <String, Object>{}
          ..addEntries(data.fields)
          ..addEntries(data.files);
        _logRequestResponseHeader(
          formDataMap,
          requestResponse: 'FORM DATA  ${data.boundary}',
        );
      } else {
        _logRequestResponseHeader(data, requestResponse: 'REQUEST BODY');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);
    if (error) {
      if (err.type == DioErrorType.response) {
        final uri = err.response?.requestOptions.uri;
        _printBoxed(
          header:
              'DIO ERROR  STATUS: ${err.response?.statusCode} ${err.response?.statusMessage}',
          text: uri.toString(),
        );
        if (err.response != null && err.response?.data != null) {
          _devLog('${err.type}');
          _logRequestResponseHeader(
            err.response,
            requestResponse: 'API ERROR',
          );
        }
      } else {
        _printBoxed(header: 'DIO ERROR  ${err.type}', text: err.message);
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _renderCurlRepresentation(response.requestOptions);
    if (responseHeader) {
      final Uri uri = response.requestOptions.uri;
      final String method = response.requestOptions.method;
      _devLog(
        'API RESPONSE METADATA ===>  \n \n METHOD NAME : $method  \n RESPONSE STATUS CODE : '
        '${response.statusCode}  \n RESPONSE STATUS MESSAGE : '
        '${response.statusMessage}  \n API REQUEST URL :${uri.toString()} \n',
      );
    }

    if (responseBody) {
      _logRequestResponseHeader(response, requestResponse: 'API RESPONSE BODY');
    }
    super.onResponse(response, handler);
  }

  void _printBoxed({String? header, String? text}) {
    _devLog('$text $header');
  }

  void _logRequestResponseHeader(Object? data, {String? requestResponse}) {
    String requestResponseData;
    try {
      const JsonEncoder jsonResponse = JsonEncoder.withIndent('  ');
      requestResponseData =
          '  ${jsonResponse.convert(const JsonDecoder().convert(data.toString())).replaceAll('\n', '\n  ')}';
    } catch (e) {
      requestResponseData = '  ${data.toString().replaceAll('\n', '\n  ')}';
    }
    _devLog('$requestResponse ==> \n $requestResponseData');
  }

  void _devLog(String message) {
    if (kReleaseMode && (baseUrl.contains('dev') || baseUrl.contains('uat'))) {
      print(
        ' TIME STAMP : ${DateTime.now()}'
        ' || MilliSeconds : '
        '${DateTime.now().millisecondsSinceEpoch}'
        ' || '
        '$message'
        ' || $logName',
      );
    } else {
      log(
        ' TIME STAMP : ${DateTime.now()}'
        ' || MilliSeconds : '
        '${DateTime.now().millisecondsSinceEpoch}'
        ' || '
        '$message'
        ' || $logName',
      );
    }
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    // add a breakpoint here so all errors can break
    try {
      log(_cURLRepresentation(requestOptions));
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions');
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    const String separator = ' \\\n\t';
    final StringBuffer components = StringBuffer('curl -i$separator');
    if (options.method.toUpperCase() != 'GET') {
      components.write('--location --request ${options.method}$separator');
    }

    components.write('"${options.uri.toString()}"$separator');

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.write('--header "$k: $v"$separator');
      }
    });

    if (options.data != null) {
      // FormData can't be JSON-serialized, so keep only their fields attributes
      if (options.data is FormData) {
        // ignore: avoid_dynamic_calls
        options.data = Map.fromEntries(options.data.fields);
      }

      // ignore: use_raw_strings
      // final data = json.encode(options.data).replaceAll('"', '\\"');
      components.write("--data-raw '${options.data}'$separator");
    }

    return components.toString();
  }
}
