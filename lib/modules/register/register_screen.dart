import 'package:flutter/material.dart';
import 'package:shop_ap/components/components.dart';
import 'package:shop_ap/modules/login/login_screen.dart';

class ShopRegisterScreen extends StatelessWidget {
  const ShopRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextButton(function: (){navigateTo(context, ShopLoginScreen());}, text: 'back')
        ],
      ),
    );
  }
}
