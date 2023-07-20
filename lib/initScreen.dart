import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/views/mobile/mobile_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/views/tab_desktop/desktop_screen.dart';
import 'package:swiggy_ui/views/tab_desktop/tab_screen.dart';
import 'package:swiggy_ui/widgets/responsive.dart';

class initScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiggyCubit,SwiggyStates>
      (
      listener: (context, state) {},
        builder: (context, state) {
          return Scaffold
            (
            body: Stack(
              children: [
                Positioned(child: Image.asset('assets/images/FoodBackground.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),),
                Column(
                  children:
                  [
                    Spacer(flex: 2,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80)
                        ),
                        width: double.infinity,
                        child: TextButton
                          (
                          onPressed: ()async
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Responsive
                              (mobile: MobileScreen(),
                                tablet: TabScreen(),
                                desktop: DesktopScreen()
                            ),));

                          },
                          child: Text('Let’s Eat',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white,),),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          );
        },

    );
  }
}
