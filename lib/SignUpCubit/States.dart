abstract class Signupstates{}
class initSignupState extends Signupstates{}
class SuccSignupState extends Signupstates{}
class ErrorSignupState extends Signupstates {
  final String Error;

  ErrorSignupState(this.Error);
}