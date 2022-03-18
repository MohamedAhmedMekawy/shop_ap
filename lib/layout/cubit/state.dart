import 'package:shop_ap/models/login_model.dart';

abstract class ShopLoginState{}
class ShopLoginInitialState extends ShopLoginState{}
class ShopLoginLoadingState extends ShopLoginState{}
class ShopLoginSuccessState extends ShopLoginState{
  final ShopLoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopChangePasswordVisibilityState extends ShopLoginState{}
class ShopLoginErorrState extends ShopLoginState{
  final String error;
  ShopLoginErorrState(this.error);
}