import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/const/var.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/states.dart';

import '../../../../main.dart';
import '../../account/ProfileScreen.dart';
import '../restaurants/restaurant_detail_screen.dart';
class SwiggyCubit extends Cubit<SwiggyStates> {
  SwiggyCubit() : super(initindex());
  static SwiggyCubit get(context) => BlocProvider.of<SwiggyCubit>(context);


  //ResComments
  String comment = '';
  TextEditingController CommentController = TextEditingController();
  String? Addcomment ;
  var userid =  FirebaseAuth.instance.currentUser!.uid;
  Future AddComment ()async{
    FirebaseFirestore.instance.collection('Comments').doc().set(
        {
          'userid': userid,
          'comment': CommentController.text
        },);

    emit(DDComment());
  }
  List<Map<String, dynamic>> comments = [];
  Future<void> RemoveComment(String comment) async {
    comments.remove(comment);
    emit(RemComment());
  }
  Future init ()async
  {
    // FirebaseFirestore.instance.collection('Comments').get().then((value) {
    //   value.docs.forEach((element) {
    //     comments.add(element.data());
    //   });
    // });
  }


//Favorites
IconData LoveIcon = Icons.favorite_outline;
  bool isLove = true;
  bool isFavo = false;
  Future AddFavorites({res,index,Tap})async{
      res[index]['isfavorite']? FirebaseFirestore.instance.collection('Restaurants').doc(res[index]['name']).update(
          {'isfavorite': true}) :  FirebaseFirestore.instance.collection('Restaurants').doc(res[index]['name']).update(
          {'isfavorite': false});
      bool isFound = false;
      for (int i = 0; i < FireFavoriteList.length; i++) {
        if (res[index]['name'] == FireFavoriteList[i]['name']) {
          isFound = true;
          break;
        }
      }

      if (isFound) {
        LoveIcon = Icons.favorite;
      } else {
        LoveIcon = Icons.favorite_outline;
      }

      if (isFound) {
      LoveIcon = Icons.favorite;
    } else {
      LoveIcon = Icons.favorite_outline;
    }
      emit(loveAddedState());
  }


  List FireFavoriteList = [];
  Future favorites ()async{
     FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value) {
        FireFavoriteList = value['favorite'];
     }
     );

  }

  // Restaurants
  List<Map<String, dynamic>> restaurants = []; //
  Future<void> AllRestaurants() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Restaurants').get();
      List<Map<String, dynamic>> restaurantFastFoodList = [];
      querySnapshot.docs.forEach((doc) {
        restaurants.length = restaurantFastFoodList.length;
        restaurantFastFoodList.add(doc.data() as Map<String,dynamic>);
        restaurants.add(doc.data() as Map<String,dynamic>);
      });
      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }

  List<Map<String, dynamic>> TryNowList = []; //
  Future<void> TryNow() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Restaurants').where('tried',isEqualTo: true).get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        if (data != null) {
          TryNowList.add(data);
        }
      });
      // print(TryNowList);
      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }

  List<Map<String, dynamic>> categoriesList = []; //
  Future categories() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('categories').get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        if (data != null) {
          categoriesList.add(data);
        }
      });

      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }

  List<Map<String, dynamic>> spotLightList1 = []; //
  Future spotLight1() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Restaurants').where('spotLight1',isEqualTo: true).get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        if (data != null) {
          spotLightList1.add(data);
        }
      });
      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }

  List<Map<String, dynamic>> spotLightList2 = []; //
  Future spotLight2() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Restaurants').where('spotLight2',isEqualTo: true).get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        if (data != null) {
          spotLightList2.add(data);
        }
      });

      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }

  List<Map<String, dynamic>> PopResList = []; //
  Future PopRes() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Restaurants').where('popular',isEqualTo: true).get();
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        if (data != null) {
          PopResList.add(data);
        }
      });
      emit(successAllResState());
    } catch (e) {
      emit(errorAllResState(e.toString()));
    }
  }
  List<Map<String, dynamic>> fastFoodScreenList = [];

  Future<void> fastFoodScreen() async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Restaurants').where('fastFood', isEqualTo: true).get();
    List<Map<String, dynamic>> restaurantFastFoodList = [];
    Res = restaurantFastFoodList;
    querySnapshot.docs.forEach((doc) {
      restaurants.length = restaurantFastFoodList.length;
          restaurantFastFoodList.add(doc.data() as Map<String,dynamic>);
      restaurants.add(doc.data() as Map<String,dynamic>);
    });
  }

  Future<void> greilScreen() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Restaurants').where('greil', isEqualTo: true).get();
    List<Map<String, dynamic>> restaurantgreilList = [];
    Res = restaurantgreilList;
    querySnapshot.docs.forEach((doc) {
      restaurants.length = restaurantgreilList.length;
      restaurantgreilList.add(doc.data() as Map<String,dynamic>);
      restaurants.add(doc.data() as Map<String,dynamic>);
    });
  }

  Future<void> fishScreen() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Restaurants').where('fish', isEqualTo: true).get();
    List<Map<String, dynamic>> restaurantfishList = [];
    Res = restaurantfishList;
    querySnapshot.docs.forEach((doc) {
      restaurants.length = restaurantfishList.length;
      restaurantfishList.add(doc.data() as Map<String,dynamic>);
      restaurants.add(doc.data() as Map<String,dynamic>);
    });
  }

  Future<void> sooryScreen() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Restaurants').where('soory', isEqualTo: true).get();
    List<Map<String, dynamic>> restaurantsooryList = [];
    Res = restaurantsooryList;
    querySnapshot.docs.forEach((doc) {
      restaurants.length = restaurantsooryList.length;
      restaurantsooryList.add(doc.data() as Map<String,dynamic>);
      restaurants.add(doc.data() as Map<String,dynamic>);
    });
  }
  var userId = FirebaseAuth.instance.currentUser?.uid;

}


