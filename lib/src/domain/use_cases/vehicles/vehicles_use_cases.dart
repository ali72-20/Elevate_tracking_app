
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/vehciles/vehicles_entity.dart';
import 'package:tracking_app/src/domain/repositories/vehicles/vehciles_repo.dart';

@injectable
class VehiclesUseCases{
  final VehiclesRepo _vehiclesRepo;
  VehiclesUseCases(this._vehiclesRepo);
  Future<ApiResult<VehiclesResponseEntity>> getAllVehicles()async{
    return await _vehiclesRepo.getAllVehicles();
  }
}