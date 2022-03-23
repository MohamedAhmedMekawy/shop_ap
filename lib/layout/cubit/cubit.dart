import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ap/layout/cubit/state.dart';
import 'package:shop_ap/models/login_model.dart';
import 'package:shop_ap/shared/network/dio_Helper.dart';
import 'package:shop_ap/shared/network/end_Point.dart';

class ShopLoginCubit extends Cubit<ShopLoginState>{
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  late ShopLoginModel loginModel;
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
/*void userLogin({
  required String email,
  required String password,
}){
  DioHelper.postData(
      url: LOGIN,
      data:{
        'email':email,
        'password':password,
      }
  ).then((value) {
    emit(ShopLoginSuccessState());
    print(value.data);
  }).catchError((error){
    emit(ShopLoginErorrState(error.toString()));
    print(error.toString());
  });
}*/

  void userLogin({
  required String email,
    required String password,
})
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email': email,
          'password': password,
        },
    ).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErorrState(error.toString()));
    });
  }
 void changePasswordVisibility(){
    isPassword =! isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ShopChangePasswordVisibilityState());
 }
}