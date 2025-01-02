import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/vehciles/vehicles_entity.dart';

abstract interface class VehiclesRepo{
  Future<ApiResult<VehiclesResponseEntity>> getAllVehicles();
}