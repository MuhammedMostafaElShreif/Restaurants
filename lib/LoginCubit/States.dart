abstract class States{}
class InitLoginState extends States{}
class SuccLoginState extends States{}
class ErrorLoginState extends States {
  final String? Error;
  ErrorLoginState(this.Error){}
}
class VisaLoginState extends States{}
