import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/mobile_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/tab_desktop/desktop_screen.dart';
import 'package:swiggy_ui/views/tab_desktop/tab_screen.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import '../../../../const/var.dart';
import '../groceries/grocery_screen.dart';
import '../restaurants/restaurant_detail_screen.dart';
class AllRestaurantsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _FoodHorizontalListView(),
                    const CustomDividerView(dividerHeight: 15.0),
                    const GroceryListView(
                      title: 'ALL RESTAURANTS',
                    ),
                    UIHelper.verticalSpaceSmall(),
                    const CustomDividerView(dividerHeight: 15.0),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Container _buildAppBar(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 5.0, right: 15.0),
        height: 60.0,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Responsive(mobile: MobileScreen(), tablet: TabScreen(), desktop: DesktopScreen()),));
              },
            ),
            UIHelper.horizontalSpaceSmall(),
            Text(
              'Home',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            UIHelper.horizontalSpaceSmall(),
            Container(
              alignment: Alignment.center,
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1.3),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Icon(Icons.arrow_forward_ios, size: 13.0),
            ),
            UIHelper.horizontalSpaceSmall(),
            Text(
              'Restaurants',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 21.0),
            ),
            UIHelper.horizontalSpaceExtraSmall(),
            const Spacer(),
            // const Icon(Icons.local_offer),
            UIHelper.horizontalSpaceExtraSmall(),
          ],
        ),
      );
}
class _FoodHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: SwiggyCubit.get(context).TryNowList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              Res = SwiggyCubit.get(context).TryNowList;
              SwiggyCubit.get(context).AddFavorites(res:SwiggyCubit.get(context).TryNowList,index: index);
              SwiggyCubit.get(context).isLove = true;
              Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantDetailScreen(
                SwiggyCubit.get(context).TryNowList[index]['image'],
                SwiggyCubit.get(context).TryNowList[index]['name'],
                SwiggyCubit.get(context).TryNowList[index]['address'],
                SwiggyCubit.get(context).TryNowList[index]['phone'],
                SwiggyCubit.get(context).TryNowList[index]['menu'],
                SwiggyCubit.get(context).TryNowList[index]['link'],
                       index
              ),));
            },
            child: Stack(
              children: <Widget>[
                Image.asset(
                  SwiggyCubit.get(context).TryNowList[index]['image'],
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                  color: Colors.white,
                  child: const Text('TRY NOW'),
                ),
                Positioned(
                  top: 1.0,
                  bottom: 20.0,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 80.0,
                    color: Colors.black38,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        SwiggyCubit.get(context).TryNowList[index]['name'],
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
