import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/loginScreen.dart';
import 'package:swiggy_ui/shared/Pref.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import '../../../const/var.dart';
import '../swiggy/restaurants/restaurant_detail_screen.dart';
import 'ProfileScreen.dart';
class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subtitleStyle = Theme.of(context).textTheme.bodyText1;
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     Text(
          //       'VINOTH',
          //       style: Theme.of(context)
          //           .textTheme
          //           .headline6!
          //           .copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),
          //     ),
          //     InkWell(
          //       child: Text(
          //         'EDIT',
          //         style: Theme.of(context)
          //             .textTheme
          //             .headline6!
          //             .copyWith(fontSize: 17.0, color: darkOrange),
          //       ),
          //       onTap: () {},
          //     )
          //   ],
          // ),
          // UIHelper.verticalSpaceSmall(),
          // Row(
          //   children: <Widget>[
          //     Text('8870123456', style: subtitleStyle),
          //     UIHelper.horizontalSpaceSmall(),
          //     ClipOval(
          //       child: Container(
          //         height: 3.0,
          //         width: 3.0,
          //         color: Colors.grey[700],
          //       ),
          //     ),
          //     UIHelper.horizontalSpaceSmall(),
          //     Text('vinothvino@icloud.com', style: subtitleStyle)
          //   ],
          // ),
          UIHelper.verticalSpaceLarge(),
          const CustomDividerView(
            dividerHeight: 1.8,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
class AccountScreen extends StatelessWidget {
  final List<String> titles = [
    'My Account',
  ];
  final List<String> body = [
    'Email, phone, Name, Favourties',
  ];
  AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _AppBar(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: titles.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: ()
                  {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                  },
                  child: _ListItem(
                    title: titles[index],
                    body: body[index],
                    isLastItem: (titles.length - 1) == index,
                  ),
                ),
              ),
              _PastOrderListView(),
            ],
          ),
        ),
      ),
    );
  }
}
class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.title,
    required this.body,
    this.isLastItem = false,
  })  : assert(title != '', body != ''),
        super(key: key);
  final String title;
  final String body;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 15.0),
                    ),
                    UIHelper.verticalSpaceExtraSmall(),
                    Text(
                      body,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              UIHelper.horizontalSpaceSmall(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
          UIHelper.verticalSpaceLarge(),
          isLastItem
              ? const SizedBox()
              : const CustomDividerView(
                  dividerHeight: 0.8,
                  color: Colors.black26,
                ),
        ],
      ),
    );
  }
}
class _PastOrderListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10.0),
                    height: 50.0,
                    child: TextButton(onPressed: ()async
                    {

                      SwiggyCubit.get(context).FireFavoriteList = [];
                      FirebaseAuth.instance.signOut().then((value) {
                        CacheHelper().setData(key: 'isLogin', value: false);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen(),),
                                (route) => false);
                      });
                    },
                      child: Text(
                        'LOGOUT',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 16.0),
                      ),)
                ),
                const Spacer(),
                const Icon(Icons.power_settings_new),
                UIHelper.horizontalSpaceSmall(),
              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 20.0),
              height: 130.0,
              color: Colors.grey[200],
              child: Text(
                'App Version v3.2.0',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey[700], fontSize: 13.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text('Favorites',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: SwiggyCubit.get(context).FireFavoriteList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Res = SwiggyCubit.get(context).FireFavoriteList;
                      SwiggyCubit.get(context).AddFavorites(res:SwiggyCubit.get(context).FireFavoriteList,index: index);
                      SwiggyCubit.get(context).isLove = false;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                          SwiggyCubit.get(context).FireFavoriteList[index]['image'] ?? '',
                          SwiggyCubit.get(context).FireFavoriteList[index]['name']?? '',
                          SwiggyCubit.get(context).FireFavoriteList[index]['address']?? '',
                          SwiggyCubit.get(context).FireFavoriteList[index]['phone']?? '',
                          SwiggyCubit.get(context).FireFavoriteList[index]['menu']?? [],
                          SwiggyCubit.get(context).FireFavoriteList[index]['link']?? '',
                          index
                      ),));
                    },
                    leading: Image.asset(SwiggyCubit.get(context).FireFavoriteList[index]['image']?? 'null'),
                    title: Text(SwiggyCubit.get(context).FireFavoriteList[index]['name']?? 'null'),
                    subtitle: Text(SwiggyCubit.get(context).FireFavoriteList[index]['address']?? '',maxLines: 1,overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
// class _PastOrdersListItemView extends StatelessWidget {
//   const _PastOrdersListItemView({
//     Key? key,
//     required this.restaurant,
//     required this.foodItem,
//   })  : assert(restaurant != '', foodItem != ''),
//         super(key: key);
//
//   final String restaurant;
//   final String foodItem;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// }
