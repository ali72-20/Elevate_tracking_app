
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/helpers/app_Regex.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';

@injectable
@singleton
class ValidatorManager{
  String? _validateFieldInput(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  String? _validateEmail(String email){
    if(email.isEmpty || !AppRegex.isEmailValid(email)){
      return "Invalid email";
    }
    return null;
  }

  String? _validatePassword(String password) {
    if(password.isEmpty || !AppRegex.isPasswordValid(password)){
      return "Invalid password";
    }
    return null;
  }

  String? _validateConfirmPassword(String password,String confirmPassword){
    if(confirmPassword.isEmpty || !AppRegex.isPasswordValid(confirmPassword)){
      return "Invalid password";
    }
    if(password != confirmPassword) {
      return "Password does not match";
    }
    return null;
  }

  String? _validatePhoneNumber(String phoneNumber){
    if(phoneNumber.isEmpty || !AppRegex.isPhoneNumberValid(phoneNumber)){
      return "Invalid phone number";
    }
    return null;
  }

  String? validateField(ApplyScreenFormFields field,TextEditingController controller, TextEditingController? password){
    switch (field) {
      case ApplyScreenFormFields.firstLegalName:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.secondLegalName:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.vehicleNumber:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.vehicleLicense:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.vehicleType:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.country:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.email:
        return _validateEmail(controller.text);
      case ApplyScreenFormFields.phoneNumber:
        return _validatePhoneNumber(controller.text);
      case ApplyScreenFormFields.idNumber:
        return _validateFieldInput(controller.text);
      case ApplyScreenFormFields.password:
        return _validatePassword(controller.text);
      case ApplyScreenFormFields.confirmPassword:
        return _validateConfirmPassword(password!.text, controller.text);
      case ApplyScreenFormFields.idImage:
        return _validateFieldInput(controller.text);
    }
    return null;
  }

}