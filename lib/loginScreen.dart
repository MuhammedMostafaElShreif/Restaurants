import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/signUpScreen.dart';
import 'LoginCubit/States.dart';
import 'LoginCubit/cubit.dart';
import 'const/helper.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,States>
        (
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
             key: LoginCubit.get(context).formKey,
            child: Scaffold(

              body: SingleChildScrollView(
                child: Container(
                  height: Helper.getScreenHeight(context),
                  width: Helper.getScreenWidth(context),
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style: Helper.getTheme(context).headline6,
                          ),
                          Spacer(),
                          Text('Add your details to login'),
                          Spacer(),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Your Email',
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
                                return 'Please enter your email';
                              }
                            },
                            onSaved: (value) {
                              // Do something with the value entered by the user
                            },
                          ),

                          Spacer(),
                          TextFormField(
                            controller: passwordController,
                            obscureText: LoginCubit.get(context).isVisibility,
                            decoration: InputDecoration(
                              labelText: 'Your Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                              ),

                              suffixIcon: GestureDetector(
                                onTap: () {
                                  LoginCubit.get(context).togglePasswordVisibility();
                                },
                                child: Icon(LoginCubit.get(context).suffixIcon),
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
                              return null;
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
                              onPressed: () {
                                LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                context: context
                                );

                              },
                              child: Text("Login",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          Spacer(),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                          }, child: Text('Create Account',style: TextStyle(color: Colors.deepOrange),)),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
