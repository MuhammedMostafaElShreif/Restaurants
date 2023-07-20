import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:swiggy_ui/const/var.dart';
import 'package:swiggy_ui/menuScreen.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/views/mobile/account/ProfileScreen.dart';
import 'package:swiggy_ui/views/mobile/account/account_screen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';
import 'package:swiggy_ui/widgets/custom_divider_view.dart';
import 'package:url_launcher/url_launcher.dart';
class _OrderNowView extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final String phone;
  final List menu;
  final String link;
  _OrderNowView(
      this.image,
      this.name,
      this.address,
      this.phone,
      this.menu,
      this.link,
      );

  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:FormKey ,
      child: BlocConsumer<SwiggyCubit, SwiggyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const CustomDividerView(dividerHeight: 15.0),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      height: 1350,
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
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
                                image,
                                height: 250.0,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: 10,),
                            UIHelper.horizontalSpaceSmall(),
                            Container(
                              child: Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                    Divider(thickness: 3,color: Colors.deepOrange,),
                                    SizedBox(height: 20,),
                                    Text(
                                      'العنوان',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: 'google',
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.deepOrange,),
                                        color: Colors.white,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          String location = address;
                                          String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$location';
                                          launch(googleMapsUrl);
                                        },
                                        child: Text(
                                          address,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: Colors.deepOrange, fontSize: 15.5),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    SizedBox(height: 20,),
                                    Text(
                                      'الهاتف',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: 'google',
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.deepOrange,),
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () {
                                          String phoneNumber = phone;
                                          String telUrl = 'tel:$phoneNumber';
                                          launch(telUrl);
                                        },
                                        child: Text(
                                          phone,
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    SizedBox(height: 20,),
                                    Text(
                                      'Facebook Page',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: 'google',
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.deepOrange,),
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      child: TextButton(
                                        onPressed: () async {
                                         launch(link);
                                        },
                                        child: Text(
                                          link,
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 16.0,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                    Divider(height: 3,color: Colors.deepOrange,thickness: 3),
                                    SizedBox(height: 20,),
                                    Text(
                                      'Menu',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: 'google',
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Icon(Icons.arrow_downward_rounded,size: 50,),
                                    Divider(height: 1,thickness: 3,color: Colors.deepOrange,),
                                    Container(
                                      height: 450,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.deepOrange,),
                                        color: Colors.white,
                                      ),
                                      width: double.infinity,
                                      child: ListView.builder(
                                        itemCount: menu.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              SizedBox(height: 70,),
                                              GestureDetector(
                                                onTap:()
                                                {
                                                  indexss = index;
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(menu: menu, indexPage: index),));
                                                },
                                                child: Center(
                                                  child: Container(
                                                    color: Colors.white,
                                                      height: 300,
                                                  child: PhotoView(
                                                    imageProvider: AssetImage(menu[index]),
                                                    customSize: Size(300,double.infinity),minScale: .05,maxScale: 1.0,
                                                  backgroundDecoration: BoxDecoration(color: Colors.white),
                                                  )),
                                                ),
                                              ),
                                              SizedBox(height: 20,)
                                            ],
                                          );
                                        }
                                      ),
                                     ),
                                    // Divider(height: 1,thickness: 3,color: Colors.deepOrange,),
                                    // SizedBox(height: 50,),
                                    // Text(' رأيك يهمنا فى التطبيق',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 30)),
                                    // Container(
                                    //   margin: const EdgeInsets.all(10.0),
                                    //   child: TextFormField(
                                    //     controller: SwiggyCubit.get(context).CommentController,
                                    //     onChanged: (value) {
                                    //       SwiggyCubit.get(context).comment = value; // تحديث متغير التعليق عند تغيير قيمة الخانة
                                    //     },
                                    //     validator: (value) {
                                    //       if(value == null )
                                    //       {
                                    //         return 'comment mustnot be null';
                                    //       }
                                    //
                                    //     },
                                    //     decoration: InputDecoration(
                                    //       hintText: 'أضف تعليقًا',
                                    //       border: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.circular(50),
                                    //       ),
                                    //       focusedBorder: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.circular(80),
                                    //         borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    // Container(
                                    //   width: double.infinity,
                                    //   height: 50,
                                    //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.deepOrange,),
                                    //   child: GestureDetector(
                                    //
                                    //     onTap: () async{
                                    //
                                    //       if(FormKey.currentState!.validate())
                                    //       {
                                    //         SwiggyCubit.get(context).comment = SwiggyCubit.get(context).CommentController.text;
                                    //         await SwiggyCubit.get(context).AddComment();
                                    //         await SwiggyCubit.get(context).init();
                                    //         SwiggyCubit.get(context).CommentController.text = '';
                                    //       }
                                    //     },
                                    //     child: Center(child: Text('إضافة التعليق',style: TextStyle(color: Colors.white,fontFamily: 'google',fontSize: 20),)),
                                    //   ),
                                    // ),
                                    // Divider(height: 50,color: Colors.deepOrange,thickness: 2),
                                    // Container(
                                    //   color: Colors.white,
                                    //   height: 300,
                                    //   child: SingleChildScrollView(
                                    //     child: ListView.builder(
                                    //       shrinkWrap: true,
                                    //       physics: NeverScrollableScrollPhysics(),
                                    //       itemCount: SwiggyCubit.get(context).comments.length,
                                    //       itemBuilder: (context, index) {
                                    //         return Container(
                                    //           margin: EdgeInsets.symmetric(vertical: 5),
                                    //           padding: EdgeInsets.all(10),
                                    //           decoration: BoxDecoration(
                                    //             color: Colors.grey[200],
                                    //             borderRadius: BorderRadius.circular(10),
                                    //           ),
                                    //           child: Column(
                                    //             children: [
                                    //               Row(
                                    //                 children: [
                                    //                   Expanded(
                                    //                     child: Text(
                                    //                       SwiggyCubit.get(context).comments[index]['comment'],
                                    //                       style: TextStyle(fontSize: 16),
                                    //                     ),
                                    //                   ),
                                    //                   // IconButton(
                                    //                   //   icon: Icon(Icons.delete),
                                    //                   //   onPressed: () {
                                    //                   //     SwiggyCubit.get(context).comment = comment;
                                    //                   //     SwiggyCubit.get(context).RemoveComment(comment);
                                    //                   //     var userid =  FirebaseAuth.instance.currentUser!.uid;
                                    //                   //     FirebaseFirestore.instance.collection('Comments').where('comment', isEqualTo: comment).
                                    //                   //     get().then((value) {
                                    //                   //       value.docs.forEach((element) {
                                    //                   //         element.reference.delete();
                                    //                   //       });
                                    //                   //     });
                                    //                   //
                                    //                   //   },
                                    //                   // ),
                                    //                 ],
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         );
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class RestaurantDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final String phone;
  final List menu;
  final String link;
  final int index;
  RestaurantDetailScreen(
      this.image,
      this.name,
      this.address,
      this.phone,
      this.menu,
      this.link,
      this.index,
      );
  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    return BlocConsumer<SwiggyCubit,SwiggyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: ()
            {Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.grey[600],
            iconTheme: const IconThemeData(color: Colors.deepOrange),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                  onPressed: () async {
                    Res[index]['isfavorite'] = !Res[index]['isfavorite'];
                    await SwiggyCubit.get(context).AddFavorites(res: Res, index: index);
                    SwiggyCubit.get(context).LoveIcon = Res[index]['isfavorite'] ? Icons.favorite : Icons.favorite_outline;

                    if (Res[index]['isfavorite']) {
                      SwiggyCubit.get(context).FireFavoriteList.add(Res[index]);
                    } else {
                      SwiggyCubit.get(context).FireFavoriteList.removeWhere((item) => item['name'] == Res[index]['name']);
                    }

                    FirebaseFirestore.instance.collection('Users').doc(userId).set({
                      'email': emailUser,
                      'password': passwordUser,
                      'name': NameUser,
                      'phone': phoneUser,
                      'favorite': SwiggyCubit.get(context).FireFavoriteList,
                    });

                  },
                  icon: Icon(SwiggyCubit.get(context).LoveIcon)
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwiggyCubit.get(context).isLove ? TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                }, child: Text(NameUser!,style: TextStyle(color: Colors.deepOrange),)): TextButton(onPressed: (){}, child: Text('Your Favorite Restaurants',style: TextStyle(color: Colors.deepOrange),))
              )
            ],
          ),
          body: _OrderNowView(image,name,address,phone,menu,link,),
        );
      },
    );
  }
}

