import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import '../../const/var.dart';
import '../../views/mobile/swiggy/restaurants/restaurant_detail_screen.dart';
class SearchFoodListItemView extends StatelessWidget {
  const SearchFoodListItemView({
    Key? key,
    required this.index,  String? itemText,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
       listener: (context, state) {},
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Res = SwiggyCubit.get(context).restaurants;
              SwiggyCubit.get(context).AddFavorites(res:SwiggyCubit.get(context).restaurants , index: index,);
              SwiggyCubit.get(context).isLove = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                SwiggyCubit.get(context).restaurants[index]['image'],
                SwiggyCubit.get(context).restaurants[index]['name'],
                SwiggyCubit.get(context).restaurants[index]['address'],
                SwiggyCubit.get(context).restaurants[index]['phone'],
                SwiggyCubit.get(context).restaurants[index]['menu'],
                SwiggyCubit.get(context).restaurants[index]['link'],
                index

              ),));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    SwiggyCubit.get(context).restaurants[index]['image'],
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.fill,
                  ),
                ),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        SwiggyCubit.get(context).restaurants[index]['name'],
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 15.0),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        SwiggyCubit.get(context).restaurants[index]['address'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey[600], fontSize: 13.5),

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),

                      UIHelper.verticalSpaceSmall(),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            size: 14.0,
                            color: Colors.grey[600],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


