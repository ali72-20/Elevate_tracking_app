sealed class ForgetPasswordScreenActions{}

class GetOtpAction extends ForgetPasswordScreenActions{}
class ConfirmEmailAction extends ForgetPasswordScreenActions{}
class GoToPrevStateAction extends ForgetPasswordScreenActions{}
class ResendOtpAction extends ForgetPasswordScreenActions{
  final bool isResend;
  ResendOtpAction({this.isResend = true});
}
class ConfirmOtpAction extends ForgetPasswordScreenActions{
  final String? otp;
  ConfirmOtpAction({this.otp});
}
class ResetPasswordAction extends ForgetPasswordScreenActions{
  final String? newPassword;
  ResetPasswordAction({this.newPassword});
}

class ValidateFieldsAction extends ForgetPasswordScreenActions{}