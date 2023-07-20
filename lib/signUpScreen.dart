import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/SignUpCubit/cubit.dart';
import 'package:swiggy_ui/shared/Pref.dart';
import '../const/colors.dart';
import 'SignUpCubit/States.dart';
import 'loginScreen.dart';
import 'const/helper.dart';
class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
 void Navi;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit,Signupstates>
        (listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: SignupCubit.get(context).formKey,
                  child: Container(
                    width: Helper.getScreenWidth(context),
                    height: Helper.getScreenHeight(context),
                    child: SafeArea(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                        child: Column(
                          children: [
                            Text(
                              "Sign Up",
                              style: Helper.getTheme(context).headline6,
                            ),
                            Spacer(),
                            Text(
                              "Add your details to sign up",
                            ),
                            Spacer(),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey,

                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (emailController.text != value) {
                                  return 'Email do not match';
                                }
                              },

                              onSaved: (value) {
                                // Do something with the value entered by the user
                              },
                            ),
                            Spacer(),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey,

                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (passwordController.text != value) {
                                  return 'Passwords do not match';
                                }
                              },
                              onSaved: (value) {
                                // Do something with the value entered by the user
                              },
                            ),
                            Spacer(),
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey,

                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name';
                                }
                                if (nameController.text != value) {
                                  return 'Passwords do not match';
                                }
                              },
                              onSaved: (value) {
                                // Do something with the value entered by the user
                              },
                            ),
                            Spacer(),
                            TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey,

                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone';
                                }
                                if (phoneController.text != value) {
                                  return 'Passwords do not match';
                                }
                              },
                              onSaved: (value) {
                                // Do something with the value entered by the user
                              },
                            ),
                            Spacer(),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: MaterialButton(
                                color: Colors.deepOrange,
                                onPressed: ()
                                {
                                  SignupCubit.get(context).userSignup
                                    (email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      context: context,
                                      Navi: SignupCubit.get(context).Navig
                                  ).then((value)
                                  async {

                                  });
                                },
                                child: Text("Sign Up"),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushAndRemoveUntil(MaterialPageRoute
                                  (builder: (context) => LoginScreen(),), (route) => false);
                                CacheHelper().setData(key: 'isSignup', value: true);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already have an Account?"),
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      color: AppColor.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
        }, )
    );
  }
}


