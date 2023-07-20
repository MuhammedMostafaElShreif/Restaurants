import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const _GroceryHeaderView(),
            UIHelper.verticalSpaceMedium(),
            const GroceryListView(
              title: '156 RESTAURANTS NEARBY',
            ),
          ],
        ),
      ),
    );
  }
}
class _GroceryHeaderView extends StatelessWidget {
  const _GroceryHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/banner3.jpg',
          height: MediaQuery.of(context).size.height / 2.1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (!isTabletDesktop)
          Positioned(
            top: 40.0,
            left: 0.4,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 28.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
      ],
    );
  }
}
class GroceryListView extends StatelessWidget {
  const GroceryListView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 13.0);
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 18.0),
              ),
              UIHelper.verticalSpaceSmall(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SwiggyCubit.get(context).restaurants.length,
                itemBuilder: (context, index) => SearchFoodListItemView(
                  index: index,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
