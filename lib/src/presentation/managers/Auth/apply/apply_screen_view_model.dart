import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/apis/api_result.dart';
import 'package:tracking_app/src/domain/entities/auth/apply_request_entity.dart';
import 'package:tracking_app/src/domain/entities/auth/apply_response_entity.dart';
import 'package:tracking_app/src/domain/entities/country/country_entity.dart';
import 'package:tracking_app/src/domain/entities/vehciles/vehicles_entity.dart';
import 'package:tracking_app/src/domain/use_cases/apply_new_user_use_case.dart';
import 'package:tracking_app/src/domain/use_cases/country/country_use_case.dart';
import 'package:tracking_app/src/domain/use_cases/vehicles/vehicles_use_cases.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_actions.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_states.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/controller_manager.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/validator_manager.dart';

@injectable
class ApplyScreenViewModel extends Cubit<ApplyScreenStates> {
  final VehiclesUseCases _vehiclesUseCases;
  final CountryUseCase _countryUseCase;
  final ApplyNewUserUseCase _applyNewUserUseCase;
  final ControllerManager _controllerManager;
  final ValidatorManager _validatorManager;
  GlobalKey<FormState> applyFormKey = GlobalKey<FormState>();
  Gender selectedGender = Gender.none;
  List<CountryEntity> countries = [];
  CountryEntity selectedCountry = CountryEntity();
  VehiclesResponseEntity selectedVehicle = VehiclesResponseEntity();
  VehiclesEntity selectedVehicleEntity = VehiclesEntity();
  bool isObscure = true;
  bool _dataloadedSuccess = true;

  ApplyScreenViewModel(this._vehiclesUseCases, this._controllerManager,
      this._countryUseCase, this._validatorManager, this._applyNewUserUseCase)
      : super(InitialState());

  TextEditingController getController(ApplyScreenFormFields controller) {
    return _controllerManager.getController(controller);
  }

  String? validateField(ApplyScreenFormFields field) {
    if (field == ApplyScreenFormFields.confirmPassword) {
      return _validatorManager.validateField(field, getController(field),
          getController(ApplyScreenFormFields.password));
    }
    return _validatorManager.validateField(field, getController(field), null);
  }

  _getAllVehicles() async {
    var response = await _vehiclesUseCases.getAllVehicles();
    switch (response) {
      case Success<VehiclesResponseEntity>():
        selectedVehicle = response.data!;
        selectedVehicleEntity = response.data!.vehicles!.first;
        break;
      case Failures<VehiclesResponseEntity>():
        _dataloadedSuccess &= false;
        emit(FailureState(exception: response.exception));
        break;
    }
  }

  _getCountries() async {
    var response = await _countryUseCase.getCountries();
    countries = response;
    selectedCountry = countries.first;
    if (_dataloadedSuccess) {
      emit(SuccessState());
    }
  }

  _getData() async {
    emit(LoadingState());
    await _getAllVehicles();
    await _getCountries();
    if (_dataloadedSuccess) {
      emit(SuccessState());
    }
  }

  ApplyRequestEntity _getNewDriverData(){
   return ApplyRequestEntity(
      firstName: getController(ApplyScreenFormFields.firstLegalName).text,
      lastName: getController(ApplyScreenFormFields.secondLegalName).text,
      vehicleNumber: getController(ApplyScreenFormFields.vehicleNumber).text,
      vehicleType: selectedVehicleEntity.Id,
      country: selectedCountry.name,
      email: getController(ApplyScreenFormFields.email).text,
      phone: getController(ApplyScreenFormFields.phoneNumber).text,
      NID: getController(ApplyScreenFormFields.idNumber).text,
      password: getController(ApplyScreenFormFields.password).text,
      rePassword: getController(ApplyScreenFormFields.confirmPassword).text,
    );
  }

  _applyNewUser() async {
    if (!applyFormKey.currentState!.validate()) {
      emit(FormFailureState(message: "Please fill all fields"));
      return;
    }
    if(selectedGender == Gender.none){
      emit(FormFailureState(message: "Select Gender"));
    }
    emit(LoadingState());
    var response = await _applyNewUserUseCase.apply(_getNewDriverData());
    switch (response) {
      case Success<ApplyResponseEntity>():
        emit(SuccessState());
      case Failures<ApplyResponseEntity>():
        emit(FailureState(exception: response.exception));
    }
  }

  void doAction(ApplyScreenActions action) {
    switch (action) {
      case ApplyNewUserAction():
        _applyNewUser();
        break;
      case GetScreenDataAction():
        _getData();
        break;
    }
  }
}

enum ApplyScreenFormFields {
  firstLegalName,
  secondLegalName,
  vehicleNumber,
  vehicleLicense,
  vehicleType,
  country,
  email,
  phoneNumber,
  idNumber,
  password,
  confirmPassword,
}

enum Gender { none, male, female }
