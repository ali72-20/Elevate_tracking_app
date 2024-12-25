import 'package:tracking_app/core/common/apis/api_result.dart';

Future<ApiResult<T>> executeApi<T>({required Future<T> Function() apiCall}) async{
  try{
    final result = await apiCall();
    return Success(data: result);
  }catch(e,stackTrace){
    print("Error: $e");
    print("Stack Trace: $stackTrace");
    return Failures(exception: e is Exception? e : Exception("unknown error"));
  }
}