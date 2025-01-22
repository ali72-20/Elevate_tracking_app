import 'package:tracking_app/src/data/api/core/api_response_models/vehicles/vehicles_response_model.dart';

abstract interface class VehiclesOnlineDataSource{
  Future<VehiclesResponseModel> getAllVehicles();
}