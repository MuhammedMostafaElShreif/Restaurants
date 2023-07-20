import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swiggy_ui/LoginCubit/States.dart';
import 'package:swiggy_ui/initScreen.dart';
import '../SignUpCubit/cubit.dart';
import '../shared/Pref.dart';
import '../views/mobile/swiggy/Cubit/cubit.dart';
class LoginCubit extends Cubit<States> {
  LoginCubit() : super(InitLoginState());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  var formKey = GlobalKey<FormState>();
  bool isVisibility = true;
  IconData suffixIcon = Icons.visibility_off;
  void togglePasswordVisibility() {
    isVisibility = !isVisibility;
    suffixIcon = isVisibility ? Icons.visibility_off : Icons.visibility;
    emit(VisaLoginState());
  }
  Future userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        ).then((value) async{
         await Users().Get();
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => initScreen()
          ),
              (route) => false,
        );
        emit(SuccLoginState());
        Fluttertoast.showToast(
          msg: 'تم تسجيل الدخول بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        await SwiggyCubit.get(context).favorites();
        CacheHelper().setData(key: 'isLogin', value: true);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(ErrorLoginState('هذا المستخدم غير موجود.'));
        } else if (e.code == 'wrong-password') {
          emit(ErrorLoginState('كلمة المرور غير صحيحة.'));
        } else {
          emit(ErrorLoginState(e.message!));
        }
        Fluttertoast.showToast(
          msg: e.code,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }
}
