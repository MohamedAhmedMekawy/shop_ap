import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ap/modules/on_boarding/on_boardingScreen.dart';
import 'package:shop_ap/shared/network/dio_Helper.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
    );
  }
}
