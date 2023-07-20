import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import '../groceries/grocery_screen.dart';
class IndianDelightScreen extends StatelessWidget {
  const IndianDelightScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
     listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/food.jpg',
                        height: MediaQuery.of(context).size.height / 5.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Bani Swief ✌️',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 19.0),
                            ),
                            UIHelper.verticalSpaceSmall(),
                            const Text(
                              'اكل بنى سويف لا يعلى عليه',
                            ),
                            UIHelper.verticalSpaceSmall(),
                            const Divider(),
                          ],
                        ),
                      ),
                      const GroceryListView(
                        title: 'RESTAURANTS',
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                left: 2.4,
                child: SafeArea(
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
