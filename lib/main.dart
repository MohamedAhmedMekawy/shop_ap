import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ap/layout/shop_layout/shop_layout.dart';
import 'package:shop_ap/modules/login/login_screen.dart';
import 'package:shop_ap/modules/on_boarding/on_boardingScreen.dart';
import 'package:shop_ap/shared/bloc_observer.dart';
import 'package:shop_ap/shared/local/cache_helper.dart';
import 'package:shop_ap/shared/network/dio_Helper.dart';
void main()async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');
  var token = CacheHelper.getData(key: 'token');
  print(token);
  if(onBoarding != null)
  {
    if(token != null) widget = ShopLayoutScreen();
    else widget = ShopLoginScreen();
  } else
  {
    widget = OnBoardingScreen();
  }
    runApp(MyApp(startWidget: widget,));
}
class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({
    required this.startWidget,
});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startWidget,
    );
  }
}
