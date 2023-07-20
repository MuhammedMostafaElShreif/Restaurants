import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import 'Cubit/states.dart';
import 'all_restaurants/all_restaurants_screen.dart';
class FoodGroceriesAvailabilityView extends StatelessWidget {
  const FoodGroceriesAvailabilityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: <Widget>[
              if (!isTabletDesktop)
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      child: Container(
                        width: 10.0,
                        height: 60.0,
                        color: swiggyOrange,
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Welcome To Our App',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          UIHelper.verticalSpaceSmall(),
                          Text(
                            'لو بتدور على مطاعم يا غالى فى بنى سويف تلاقى',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16.0,
                              color: Colors.grey[800],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              if (!isTabletDesktop) UIHelper.verticalSpaceLarge(),
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: InkWell(
                      child: Container(
                        height: 160.0,
                        color: swiggyOrange,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.7,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Restaurants',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(color: Colors.white),
                                      ),
                                      UIHelper.verticalSpaceExtraSmall(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 45.0,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              color: darkOrange,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'View all',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                        color: Colors.white, fontSize: 18.0),
                                  ),
                                  UIHelper.horizontalSpaceSmall(),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: isTabletDesktop
                          ? () {}
                          : () async{
                        await SwiggyCubit.get(context).AllRestaurants().then((value) {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllRestaurantsScreen(
                            ),
                          ),
                        );
                        });

                      },
                    ),
                  ),
                  Positioned(
                    top: -10.0,
                    right: -10.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/plate-food1.jpg',
                        width: 130.0,
                        height: 130.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium(),
            ],
          ),
        );
      },
    );
  }
}
