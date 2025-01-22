import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/domain/entities/vehciles/vehicles_entity.dart';
import 'package:tracking_app/src/domain/use_cases/country/country_use_case.dart';
import 'package:tracking_app/src/domain/use_cases/vehicles/vehicles_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/controller_manager.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/validator_manager.dart';

@injectable
class ApplyScreenViewModel extends Cubit<ApplyScreenStates>{
  final VehiclesUseCases _vehiclesUseCases;
  final CountryUseCase _countryUseCase;
  final ControllerManager _controllerManager;
  GlobalKey<FormState> applyFormKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.none;
  List<CountryEntity> countries = [];
  CountryEntity selectedCountry = CountryEntity();
  VehiclesResponseEntity selectedVehicle = VehiclesResponseEntity();


  ApplyScreenViewModel(this._vehiclesUseCases,this._controllerManager,this._countryUseCase): super(InitialState());

  TextEditingController getController(ApplyScreenFormFields controller){
    return _controllerManager.getController(controller);
  }

  String? validateField(ApplyScreenFormFields field){
    String value = _controllerManager.getController(field).text;
    if(value.isEmpty){
      return "This field is required";
    }
    return null;
  }

  _getAllVehicles() async{
    emit(LoadingState());
    var response = await _vehiclesUseCases.getAllVehicles();
    switch (response) {
      case Success<VehiclesResponseEntity>():
        emit(SuccessState());
        break;
      case Failures<VehiclesResponseEntity>():
        emit(FailureState(exception: response.exception));
        break;
    }
  }

  _getCountries() async{
    var response = await _countryUseCase.getCountries();
    countries = response;
  }

  _applyNewUser() async{}

  void doAction(ApplyScreenActions action){
    switch (action) {
      case GetAllVehiclesAction():
        _getAllVehicles();
        break;
      case GetCountriesAction():
        _getCountries();
        break;
      case ApplyNewUserAction():
        _applyNewUser();
        break;
    }
  }
}
enum ApplyScreenFormFields{
    firstLegalName,
    secondLegalName,
    vehicleNumber,
    vehicleLicense,
    country,
    email,
    phoneNumber,
    idNumber,
}

enum Gender{
  none,
  male,
  female
}