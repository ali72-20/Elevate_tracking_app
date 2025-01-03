import 'change_password_view_model.dart';

sealed class ChangePasswordScreenAction{
}

class ChangePasswordAction extends ChangePasswordScreenAction{}
class CheckInputValidation extends ChangePasswordScreenAction{}