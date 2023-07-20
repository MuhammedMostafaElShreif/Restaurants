abstract class SwiggyStates{}
class initindex extends SwiggyStates{}
class indexx extends SwiggyStates{}
class DDComment extends SwiggyStates{}
class RemComment extends SwiggyStates{}
class RemDoc extends SwiggyStates{}
class successAllResState extends SwiggyStates{}
class errorAllResState extends SwiggyStates{
  final String error;

  errorAllResState(this.error);
}
class loveAddedState extends SwiggyStates{}
class ResDatailsState extends SwiggyStates{}
class loveErrorState extends SwiggyStates{}

