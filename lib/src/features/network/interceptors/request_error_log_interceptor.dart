import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flcore/flcore.dart';

final class RequestErrorLogInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err);
    super.onError(err, handler);
  }

  Future<void> _logError(DioException err) async {
    final statusCode = err.response?.statusCode;

    if (statusCode != null && statusCode < 500) return;

    final url = err.requestOptions.uri.toString();
    final requestData = err.requestOptions.data.toString();
    final requestHeader = err.requestOptions.headers.toString();
    final requestMethod = err.requestOptions.method;
    final error = err.toString().replaceAll('"', '').replaceAll('\n', '');

    final errLogString = '''
    {
      "url": "$url",
      "statusCode": "$statusCode",
      "requestData": "$requestData",
      "requestHeader": "$requestHeader",
      "requestMethod": "$requestMethod",
      "error": "$error",
     }
    ''';

    await FirebaseCrashlytics.instance.recordError(errLogString, StackTrace.current);
  }
}
