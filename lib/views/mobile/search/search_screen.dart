import 'package:flutter/material.dart';
import 'package:swiggy_ui/utils/app_colors.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:swiggy_ui/widgets/mobile/search_food_list_item_view.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String searchText = "";
  List<String> searchFoodList = [
    ', 23 yolyo 23 يوليو , 23 yolyo, مطعم',
    'AliBaba ,Ali Baba , مطعم,على بابا',
    'PUBG Chicken,PUBGChicken بابجى,مطعم',
    'caviar, مافيار,مطعم',
    'lamera, مطعم و لاميرا',
    ',مطعم الدمشقي للمأكولات السورية بني سويف,eldemashky',
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding:
                const EdgeInsets.only(left: 15.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for restaurants',
                          hintStyle:
                          Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.grey,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceMedium(),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: FoodSearchDelegate(
                            foodItems: searchFoodList,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpaceExtraSmall(),
              TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                controller: _tabController,
                indicatorColor: darkOrange,
                labelStyle: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 18.0, color: darkOrange),
                unselectedLabelStyle:
                Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontSize: 18.0,
                  color: Colors.grey[200],
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(child: Text('Restaurant')),
                  // Tab(child: Text('Dishes')),
                ],
              ),
              UIHelper.verticalSpaceSmall(),
              const CustomDividerView(dividerHeight: 8.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _SearchListView(
                      searchFoodList: searchFoodList,
                      searchText: searchText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class _SearchListView extends StatelessWidget {
  final List<String> searchFoodList;
  final String searchText;
  const _SearchListView({
    Key? key,
    required this.searchFoodList,
    required this.searchText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: searchFoodList.length,
      itemBuilder: (context, index) {
        final item = searchFoodList[index];
        if (searchText.isNotEmpty &&
            !item.toLowerCase().contains(searchText.toLowerCase())) {
          return Container();
        }
        return SearchFoodListItemView(index: index);
      },
    );
  }
}
class FoodSearchDelegate extends SearchDelegate<String> {
  final List<String> foodItems;
  FoodSearchDelegate({required this.foodItems});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    final results = foodItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = foodItems
        .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
