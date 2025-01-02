
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/data/api/api_services.dart';
import 'package:tracking_app/src/data/api/core/api_response_models/vehicles/vehicles_response_model.dart';
import 'package:tracking_app/src/data/data_sources/online_data_source/vehicles/vehicles_online_data_source.dart';

@Injectable(as: VehiclesOnlineDataSource)
class VehiclesOnlineDataSourceImpl implements VehiclesOnlineDataSource{
  final ApiServices _apiServices;
  VehiclesOnlineDataSourceImpl(this._apiServices);
  @override
  Future<VehiclesResponseModel> getAllVehicles() async{
    return await _apiServices.getAllVehicles();
  }
}