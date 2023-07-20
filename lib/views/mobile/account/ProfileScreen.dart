import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/const/var.dart';
import 'package:swiggy_ui/views/mobile/mobile_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/views/tab_desktop/desktop_screen.dart';
import 'package:swiggy_ui/views/tab_desktop/tab_screen.dart';
import 'package:swiggy_ui/widgets/responsive.dart';
import '../swiggy/restaurants/restaurant_detail_screen.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Responsive(mobile: MobileScreen(), tablet: TabScreen(), desktop: DesktopScreen()),));
              },
          icon: Icon(Icons.arrow_back),
          ),
          centerTitle: true,
        backgroundColor: Colors.grey[600],
        iconTheme: IconThemeData(color: Colors.deepOrange),
        title: Text('Profile ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
        ),
          body: BlocConsumer<SwiggyCubit,SwiggyStates>(
           listener: (context, state) {},
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      Row(
                        children: [
                          Icon(Icons.account_box_rounded,size: 75,),
                          SizedBox(width: 10,),
                          Center(child: Text('Your Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(height: 10,color: Colors.deepOrange,),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
                        child: Text('name : ${NameUser}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),maxLines: 2,overflow: TextOverflow.ellipsis,),),
                      SizedBox(height: 10,),
                      Divider(height: 10,color: Colors.deepOrange,),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
                        child: Text('email : ${emailUser}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),maxLines: 2,overflow: TextOverflow.ellipsis,),),
                      SizedBox(height: 10,),
                      Divider(height: 10,color: Colors.deepOrange,),
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerLeft,
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
                        child: Text('phone : ${phoneUser}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),),),
                      SizedBox(height: 10,),
                      Divider(height: 10,color: Colors.deepOrange,),
                      SizedBox(height: 30,),
                      Text('Favorites',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
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
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
//Container(
//
//                                 width: 30,
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Image.asset(SwiggyCubit.get(context).FavoritesList[index]['image'],height: 50,width: 50,),
//                                     SizedBox(width: 20,),
//                                     Container(
//                                       height: 20,
//                                       width: 240,
//                                       child: ListTile(
//                                         title:  Container(
//
//                                             child: Text(SwiggyCubit.get(context).FavoritesList[index]['name'],)),
//                                          subtitle: Container(
//                                              child: Text(SwiggyCubit.get(context).FavoritesList[index]['address'],)),
//                                       ),
//                                     ),
//                                   ],
//
//                                 ),
//                               );