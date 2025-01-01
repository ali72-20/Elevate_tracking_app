
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/src/presentation/managers/Auth/apply/apply_screen_view_model.dart';

@injectable
@singleton
class ControllerManager{
  TextEditingController fistLegalNameController = TextEditingController();
  TextEditingController secondLegalNameController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController getController(ApplyScreenFormFields controller){
    switch (controller) {
      case ApplyScreenFormFields.firstLegalName:
        return fistLegalNameController;
      case ApplyScreenFormFields.secondLegalName:
        return secondLegalNameController;
      case ApplyScreenFormFields.vehicleNumber:
         return vehicleNumberController;
      case ApplyScreenFormFields.email:
        return emailController;
      case ApplyScreenFormFields.phoneNumber:
        return phoneNumberController;
      case ApplyScreenFormFields.idNumber:
        return idNumberController;
    }
  }
}