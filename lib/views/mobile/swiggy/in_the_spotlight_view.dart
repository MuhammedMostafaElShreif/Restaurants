import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/account/account_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/views/mobile/swiggy/restaurants/restaurant_detail_screen.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import '../../../const/var.dart';
class InTheSpotlightView extends StatelessWidget {
  InTheSpotlightView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    final customWidth =
        MediaQuery.of(context).size.width / (isTabletDesktop ? 3.8 : 1.1);

    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              UIHelper.verticalSpaceSmall(),
              _buildSpotlightHeaderView(context),
              UIHelper.verticalSpaceMedium(),
              LimitedBox(
                maxHeight: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: SwiggyCubit.get(context).spotLightList1.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: customWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Res = SwiggyCubit.get(context).spotLightList1;
                            SwiggyCubit.get(context).AddFavorites(res: SwiggyCubit.get(context).spotLightList1,index: index,
                            );
                            SwiggyCubit.get(context).isLove = true;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                              SwiggyCubit.get(context).spotLightList1[index]['image'],
                              SwiggyCubit.get(context).spotLightList1[index]['name'],
                              SwiggyCubit.get(context).spotLightList1[index]['address'],
                              SwiggyCubit.get(context).spotLightList1[index]['phone'],
                              SwiggyCubit.get(context).spotLightList1[index]['menu'],
                              SwiggyCubit.get(context).spotLightList1[index]['link'],
                       index

                            ),));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                      )
                                    ],
                                  ),
                                  child: Image.asset(
                                    SwiggyCubit.get(context).spotLightList1[index]['image'],
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                UIHelper.horizontalSpaceSmall(),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        SwiggyCubit.get(context).spotLightList1[index]['name'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(fontSize: 18.0),
                                      ),
                                      Text(
                                        SwiggyCubit.get(context).spotLightList1[index]['address'],
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.grey[800], fontSize: 13.5),
                                      ),

                                      UIHelper.verticalSpaceSmall(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              LimitedBox(
                maxHeight: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: SwiggyCubit.get(context).spotLightList2.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: customWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Res = SwiggyCubit.get(context).spotLightList2;
                            SwiggyCubit.get(context).AddFavorites(res: SwiggyCubit.get(context).spotLightList2,index: index);
                            SwiggyCubit.get(context).isLove = true;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                              SwiggyCubit.get(context).spotLightList2[index]['image'],
                              SwiggyCubit.get(context).spotLightList2[index]['name'],
                              SwiggyCubit.get(context).spotLightList2[index]['address'],
                              SwiggyCubit.get(context).spotLightList2[index]['phone'],
                              SwiggyCubit.get(context).spotLightList2[index]['menu'],
                              SwiggyCubit.get(context).spotLightList2[index]['link'],
                                   index
                            ),));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                      )
                                    ],
                                  ),
                                  child: Image.asset(
                                    SwiggyCubit.get(context).spotLightList2[index]['image'],
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                UIHelper.horizontalSpaceSmall(),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        SwiggyCubit.get(context).spotLightList2[index]['name'],
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(fontSize: 18.0),
                                      ),
                                      Text(
                                        SwiggyCubit.get(context).spotLightList2[index]['address'],
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(color: Colors.grey[800], fontSize: 13.5),
                                      ),

                                      UIHelper.verticalSpaceSmall(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _buildSpotlightHeaderView(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(Icons.shopping_basket, size: 20.0),
                UIHelper.horizontalSpaceSmall(),
                Text(
                  'اشهر المطاعم',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 20.0),
                )
              ],
            ),
            UIHelper.verticalSpaceExtraSmall(),
            Text(
              'مطاعم بنى سويف مش زى اى مطاعم',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey),
            ),
          ],
        ),
      );
}