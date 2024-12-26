sealed class ForgetPasswordScreenActions{}

class GetOtpAction extends ForgetPasswordScreenActions{}
class ConfirmEmailAction extends ForgetPasswordScreenActions{}
class GoToPrevStateAction extends ForgetPasswordScreenActions{}
class ResendOtpAction extends ForgetPasswordScreenActions{
  final bool isResend;
  ResendOtpAction({this.isResend = true});
}