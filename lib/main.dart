import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiggy_ui/const/var.dart';

import 'package:swiggy_ui/initScreen.dart';
import 'package:swiggy_ui/shared/Pref.dart';
import 'package:swiggy_ui/signUpScreen.dart';
import 'package:swiggy_ui/views/mobile/swiggy/Cubit/cubit.dart';
import 'SignUpCubit/cubit.dart';
import 'shared/app_theme.dart';
import 'loginScreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  }
  await Users().Get() ;
  // await GetComment().init();
  runApp(
     MultiBlocProvider(
      providers: await [
      await  BlocProvider(create: (context) => SwiggyCubit()..AllRestaurants()..TryNow()..categories()..spotLight1()..
      spotLight2()..PopRes()..favorites()..init()),
      ],
      child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashView()),
    ),
  );
}

// class MyApp extends StatefulWidget {
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     final bool? isSignup = CacheHelper().getData(key: 'isSignup');
//     final bool? isLogin = CacheHelper().getData(key: 'isLogin');
//     int? number;
//     List<Widget> Screens =
//     [
//       SignUpScreen(),
//       LoginScreen(),
//       initScreen()
//     ];
//     if(isSignup == null)
//     {
//       number = 0;
//     }if(isSignup != null)
//     {
//       number = 1;
//     }if(isLogin != null && isLogin != false)
//     {
//       number = 2;
//     }
//
//     return MaterialApp(
//       title: 'SwiggyUI',
//       debugShowCheckedModeBanner: false,
//       theme: appPrimaryTheme(),
//       home:   Screens[number!],
//     );
//   }
// }




class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // يمكنك هنا تنفيذ أي عمليات استعدادية قبل التنقل إلى الشاشة التالية
    // مثلاً يمكنك تحميل البيانات الأولية أو إجراء عملية المصادقة
    // يُفضل أيضًا تعيين وقت انتهاء العرض (على سبيل المثال 2-3 ثوانٍ) قبل الانتقال إلى الشاشة التالية
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NextScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/FoodSplash.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.fill),
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    final bool? isSignup = CacheHelper().getData(key: 'isSignup');
    final bool? isLogin = CacheHelper().getData(key: 'isLogin');
    int? number;
    List<Widget> Screens =
    [
      SignUpScreen(),
      LoginScreen(),
      initScreen()
    ];
    if(isSignup == null)
    {
      number = 0;
    }if(isSignup != null)
    {
      number = 1;
    }if(isLogin != null && isLogin != false)
    {
      number = 2;
    }

    return MaterialApp(
      title: 'SwiggyUI',
      debugShowCheckedModeBanner: false,
      theme: appPrimaryTheme(),
      home:   Screens[number!],
    );
  }
}

//
// class MenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('قائمة الطعام'),
//       ),
//       body: ListView(
//         children: [
//           SectionWidget(
//             title: 'السلطات',
//             items: ['سلطة الجرجير', 'سلطة الفواكه', 'سلطة السيزر'],
//           ),
//           SectionWidget(
//             title: 'المقبلات',
//             items: ['فتوش', 'حمص', 'متبل'],
//           ),
//           // إضافة المزيد من أقسام الطعام هنا
//         ],
//       ),
//     );
//   }
// }
//
// class SectionWidget extends StatefulWidget {
//   final String title;
//   final List<String> items;
//
//   SectionWidget({required this.title, required this.items});
//
//   @override
//   _SectionWidgetState createState() => _SectionWidgetState();
// }
//
// class _SectionWidgetState extends State<SectionWidget> {
//   bool isExpanded = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ExpansionTile(
//         title: Text(
//           widget.title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         children: widget.items.map((item) {
//           return ListTile(
//             title: Text(item),
//             onTap: () {
//               // تنفيذ إجراء عند النقر على العنصر
//             },
//           );
//         }).toList(),
//         onExpansionChanged: (value) {
//           setState(() {
//             isExpanded = value;
//           });
//         },
//         initiallyExpanded: isExpanded,
//       ),
//     );
//   }
// }




