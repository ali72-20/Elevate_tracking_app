sealed class ApiResult<T>{

}

class Success<T> extends ApiResult<T>{
  T? data;
  Success({this.data});
}

class Failures<T> extends ApiResult<T>{
  Exception exception;
  Failures({required this.exception});
}