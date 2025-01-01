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
  final ValidatorManager _validatorManager;
  GlobalKey<FormState> applyFormKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.none;
  List<CountryEntity> countries = [];



  ApplyScreenViewModel(this._vehiclesUseCases,this._controllerManager,this._validatorManager,this._countryUseCase): super(InitialState());

  TextEditingController getController(ApplyScreenFormFields controller){
    return _controllerManager.getController(controller);
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

  void doAction(ApplyScreenActions action){
    switch (action) {
      case GetAllVehiclesAction():
        _getAllVehicles();
        break;
      case GetCountriesAction():
        _getCountries();
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