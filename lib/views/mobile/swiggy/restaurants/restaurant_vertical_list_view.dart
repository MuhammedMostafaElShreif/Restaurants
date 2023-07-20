import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import '../../../../const/var.dart';
import '../Cubit/cubit.dart';
import 'restaurant_detail_screen.dart';
class RestaurantVerticalListView extends StatelessWidget {
  final String title;
  final bool isAllRestaurantNearby;
  const RestaurantVerticalListView({
    Key? key,
    required this.title,
    this.isAllRestaurantNearby = true,
  })  : assert(title != ''),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Icon(Icons.favorite),
                  Text(
                    title,
                    style:
                    Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.0),
                  ),
                ],
              ),
              const SizedBox(),
              UIHelper.verticalSpaceMedium(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SwiggyCubit.get(context).PopResList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Res = SwiggyCubit.get(context).PopResList;
                    SwiggyCubit.get(context).AddFavorites(res: SwiggyCubit.get(context).PopResList,index: index);
                    SwiggyCubit.get(context).isLove = true;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                      SwiggyCubit.get(context).PopResList[index]['image'],
                      SwiggyCubit.get(context).PopResList[index]['name'],
                      SwiggyCubit.get(context).PopResList[index]['address'],
                      SwiggyCubit.get(context).PopResList[index]['phone'],
                      SwiggyCubit.get(context).PopResList[index]['menu'],
                      SwiggyCubit.get(context).PopResList[index]['link'],
                       index
                    ),));
                  },
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
                          SwiggyCubit.get(context).PopResList[index]['image'],
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      UIHelper.horizontalSpaceMedium(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            SwiggyCubit.get(context).PopResList[index]['name'],
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 18.0,overflow: TextOverflow.ellipsis),
                            maxLines: 3,
                          ),
                          SizedBox(height: 2,),
                          Container(
                            width: 250,
                            child: Text(
                              SwiggyCubit.get(context).PopResList[index]['address'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.grey[800], fontSize: 13.5,overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(height: 2,),
                          UIHelper.verticalSpaceExtraSmall(),
                          SizedBox(height: 30,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
