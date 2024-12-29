import 'package:flcore/flcore.dart';
import 'package:injectable/injectable.dart';
import 'package:specarmobile/src/common/constants/constants.dart';
import 'package:specarmobile/src/common/network/base_response.dart';
import 'package:specarmobile/src/common/network/interceptors/request_error_log_interceptor.dart';

typedef ValidateStatus = bool Function(int? statusCode);

@lazySingleton
final class NetworkManager extends FLNetworkManager {
  NetworkManager()
      : super(
          baseOptions: BaseOptions(
            baseUrl: Constants.networkConstants.baseUrl,
          ),
          interceptors: [
            RequestErrorLogInterceptor(),
          ],
          printLogRequestInfo: true,
        );

  @override
  Future<BaseResponse<T>> request<T, M extends BaseModel<dynamic>>({
    required BaseRequestPath path,
    required RequestType type,
    required M responseEntityModel,
    bool hasBaseResponse = true,
    BaseModel<dynamic>? data,
    FormData? dioFormData,
    BaseModel<dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    ResponseType? responseType,
    CancelToken? cancelToken,
    ValidateStatus? validateStatus,
    Duration connectionTimeout = const Duration(seconds: 25),
    Duration receiveTimeout = const Duration(seconds: 25),
    Duration sendTimeout = const Duration(seconds: 25),
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    return await super.request<T, M>(
      path: path,
      type: type,
      responseEntityModel: responseEntityModel,
      hasBaseResponse: hasBaseResponse,
      data: data,
      dioFormData: dioFormData,
      queryParameters: queryParameters,
      headers: headers,
      pathSuffix: pathSuffix,
      contentType: contentType,
      responseType: responseType,
      cancelToken: cancelToken,
      validateStatus: validateStatus,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    ) as BaseResponse<T>;
  }

  @override
  Future<BaseResponse<T>> primitiveRequest<T>({
    required BaseRequestPath path,
    required RequestType type,
    BaseModel<dynamic>? data,
    FormData? dioFormData,
    BaseModel<dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? pathSuffix,
    String? contentType,
    ResponseType? responseType,
    CancelToken? cancelToken,
    ValidateStatus? validateStatus,
    Duration connectionTimeout = const Duration(seconds: 25),
    Duration receiveTimeout = const Duration(seconds: 25),
    Duration sendTimeout = const Duration(seconds: 25),
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) async {
    return await super.primitiveRequest<T>(
      path: path,
      type: type,
      data: data,
      dioFormData: dioFormData,
      queryParameters: queryParameters,
      headers: headers,
      pathSuffix: pathSuffix,
      contentType: contentType,
      responseType: responseType,
      cancelToken: cancelToken,
      validateStatus: validateStatus,
      connectionTimeout: connectionTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    ) as BaseResponse<T>;
  }

  @override
  Map<String, dynamic> generateHeaders({required BaseRequestPath path}) {
    return <String, dynamic>{};
    // String? token() => _authRepository.getUserCredentials()?.accessToken;

    // return switch (path) {
    //   RequestPath.login || RequestPath.appVersionState => {},
    //   _ => {'Authorization': 'Bearer ${token()}'},
    //   /* _ => {
    //       'Authorization':
    //           'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IkE1MDI1MjhBMkRCRjg5NEU5NDhENzU5RjE3MDA1NjlBQkRFNUI4QkJSUzI1NiIsInR5cCI6ImF0K2p3dCIsIng1dCI6InBRSlNpaTJfaVU2VWpYV2ZGd0JXbXIzbHVMcyJ9.eyJuYmYiOjE3MTc0ODM4MjQsImV4cCI6MTcxNzUwMTgyNCwiaXNzIjoiaHR0cDovLzE3Mi4yMS4xMi4xNjc6MzgwMiIsImNsaWVudF9pZCI6ImFuZ3VsYXItY2xpZW50Iiwic3ViIjoiODliYzJkNWEtNDU3Zi00Y2ZhLTg0MzctNGUzMzQzZGU5YTQwIiwiYXV0aF90aW1lIjoxNzE3NDgzODI0LCJpZHAiOiJsb2NhbCIsInVzZXJJZCI6Ijg5YmMyZDVhLTQ1N2YtNGNmYS04NDM3LTRlMzM0M2RlOWE0MCIsInVzZXJOYW1lIjoiS29yYXkiLCJqdGkiOiJBMkI0OTY1RjE4Q0M5QUM4QkZENkY1QjQxNzE3NTM1QiIsImlhdCI6MTcxNzQ4MzgyNCwic2NvcGUiOlsiYXBpMSIsIm9wZW5pZCIsInByb2ZpbGUiLCJvZmZsaW5lX2FjY2VzcyJdLCJhbXIiOlsicHdkIl19.lfIXlLxpEiizVeVM0koZQipYELi9f0v4CRoPOdqL16wGcOUk3xI_hCX8-GnIwc1aLmCQScja8uwqDDtYjPY4QbaOI4AAiqY42ChUGoCer_o4PGvDW1GLsi4FG1uFI8xhy_GZiW8iF9Qvy0rBwjZEYmogYhSUg1AKwjkF_ud2vbl96gKW4pZz-9z4rZrp0SvuAwwjv2ywjzgiIuQrg1XGtVoJxed53TM1ro5imtMwhA3PKHct6mN1Rlq_IJleWZwdyCFYWuWtAK6BYzgy7aemIRvUrt-2MWG8Mk2qqcd2igpxNKmC3gwiUj3yuhHMd8cCtRFe4zWdjYNm99BHGT2DCA',
    //     } */
    // };
  }

  @override
  void onUnauthorized(DioException error) {
    // if (error.requestOptions.path != RequestPath.login.asString) {
    //   _userRepository.deleteLocalUser();
    //   _authRepository
    //     ..deleteUserCredentials()
    //     ..changeAuthState(authState: const AuthState.unAuthenticated());
    // }
  }

  @override
  void onServiceUnavailable(DioException error) {}

  @override
  BaseResponse<T> getSuccessPrimitiveResponse<T>({required Response<T> response}) => BaseResponse(data: response.data, succeeded: true, statusCode: response.statusCode);

  @override
  BaseResponse<T> getSuccessResponse<T, M extends BaseModel<dynamic>>({required Response<Map<String, dynamic>> response, required M responseEntityModel, required bool hasBaseResponse}) {
    late dynamic json;
    if (hasBaseResponse) {
      json = response.data?['data'];
    } else {
      json = response.data;
    }

    T? data;

    if (json is List<dynamic>) {
      data = json.map((e) => responseEntityModel.fromJson(e as Map<String, dynamic>)).toList().cast<M>() as T;
    } else if (json is Map<String, dynamic>) {
      data = responseEntityModel.fromJson(json) as T;
    }

    final succeeded = response.data?['succeeded'] as bool?;
    final messagesList = response.data?['messages'] as List?;
    List<Message>? messages;
    if (messagesList.isNotNullAndNotEmpty) {
      messages = messagesList!.cast<Map<String, dynamic>>().map(Message.fromJson).toList();
    }
    final statusCode = response.statusCode;

    return BaseResponse<T>(data: data, succeeded: succeeded, messages: messages, statusCode: statusCode);
  }

  @override
  BaseResponse<T> getErrorResponse<T>({required Object error}) {
    final statusCode = error is DioException ? error.response?.statusCode : null;
    List<dynamic>? messagesList;
    if (error is DioException && error.response?.data is Map<String, dynamic>) {
      messagesList = (error.response?.data as Map<String, dynamic>)['messages'] as List?;
    }
    final messages = messagesList?.cast<Map<String, dynamic>>().map(Message.fromJson).toList();

    return BaseResponse<T>(statusCode: statusCode, error: error, messages: messages);
  }
}
