
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_executer.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source.dart';
import 'package:tracking_app/src/domain/entities/vehciles/vehicles_entity.dart';
import 'package:tracking_app/src/domain/repositories/vehicles/vehciles_repo.dart';

@Injectable(as: VehiclesRepo)
class VehicleRepoImpl implements VehiclesRepo {
  final VehiclesOnlineDataSource _vehiclesOnlineDataSource;

  VehicleRepoImpl(this._vehiclesOnlineDataSource);

  @override
  Future<ApiResult<VehiclesResponseEntity>> getAllVehicles() async{
    return await executeApi<VehiclesResponseEntity>(apiCall: ()async{
      var response = await _vehiclesOnlineDataSource.getAllVehicles();
      return response.toDomain();
    });
  }
}