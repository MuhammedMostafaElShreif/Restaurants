import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'indian_delight_screen.dart';
class IndianFoodView extends StatelessWidget {
  IndianFoodView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
     listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(15.0),
          height: 150.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: SwiggyCubit.get(context).categoriesList.length,
            itemBuilder: (context, index) => InkWell(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        SwiggyCubit.get(context).categoriesList[index]['image'],
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    UIHelper.verticalSpaceExtraSmall(),
                    Text(
                      SwiggyCubit.get(context).categoriesList[index]['name'],
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: Colors.grey[700]),
                    )
                  ],
                ),
              ),
              onTap: () async{
               if(index == 0)
               {
                 SwiggyCubit.get(context).isLove = true;
                 await SwiggyCubit.get(context).fastFoodScreen().then((value) {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const IndianDelightScreen(),
                     ),
                   );
                 });
               }
               if(index == 1)
               {
                 SwiggyCubit.get(context).isLove = true;
                 await SwiggyCubit.get(context).fishScreen().then((value) {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const IndianDelightScreen(),
                     ),
                   );
                 });
               }
               if(index == 2)
               {
                 SwiggyCubit.get(context).isLove = true;
                 await SwiggyCubit.get(context).greilScreen().then((value) {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const IndianDelightScreen(),
                     ),
                   );
                 });
               }
               if(index == 3)
               {
                 SwiggyCubit.get(context).isLove = true;
                 await SwiggyCubit.get(context).sooryScreen().then((value) {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const IndianDelightScreen(),
                     ),
                   );
                 });
               }
              },
            ),
          ),
        );
      },
    );
  }
}
