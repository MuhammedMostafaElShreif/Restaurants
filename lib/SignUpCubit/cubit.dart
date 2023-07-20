import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swiggy_ui/const/var.dart';
import '../loginScreen.dart';
import '../models/SignUpModel.dart';
import '../shared/Pref.dart';
import 'States.dart';
class SignupCubit extends Cubit<Signupstates> {
  SignupCubit() : super(initSignupState());
  static SignupCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  void Navig(context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }
  Future userSignup({
    required String email,
     String? password,
    required String name,
    required String phone,
    dynamic context,
    dynamic Navi ,
  }) async {

    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password!,
        );
        var userid =  FirebaseAuth.instance.currentUser!.uid;
        FirebaseFirestore.instance.collection('Users').doc(userid).set(
            {
              'email': email,
              'password': password,
              'name': name,
              'phone':phone,
            }
            );
        FirebaseFirestore.instance.collection('Users').doc(userid).collection('favorites');
        emit(SuccSignupState());
        Fluttertoast.showToast(
          msg: 'تم ادخال حسابك بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navi(context);
        CacheHelper().setData(key: 'isSignup', value: true);
      }
      on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(ErrorSignupState('هذا المستخدم غير موجود.'));
        } else if (e.code == 'wrong-password') {
          emit(ErrorSignupState('كلمة المرور غير صحيحة.'));
        } else {
          emit(ErrorSignupState(e.message!));
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
class Users {
  var formKey = GlobalKey<FormState>();
  Future Get ()async
  {
    var userid =  FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('Users').doc(userid).get().then((value)
    {
     {
       if(value.data() != null ){
         var data  = value.data() as Map<String,dynamic>;
       NameUser = SignupModle.fromJson(data).name ;
       phoneUser =SignupModle.fromJson(data).phone ;
       SignupModle.fromJson(data).password ;
       emailUser= SignupModle.fromJson(data).email ;
       print( SignupModle.fromJson(data).name);}
     }
    }
    );
  }
}