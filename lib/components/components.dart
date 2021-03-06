import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) =>  Navigator.push(
  context, MaterialPageRoute(
    builder: (context) => widget
),
);
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);
Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  bool isClicked = true,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  enabled: isClicked,
  onFieldSubmitted: (s){onSubmit!(s);},
  onChanged: (s){onChange!(s);},
  onTap: (){onTap!();},
  validator: (s){validate(s);},
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ? IconButton(onPressed: (){
        suffixPressed!();
      }, icon: Icon(suffix)) : null,
      border: OutlineInputBorder()
  ),
);
Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10,
  required Function function,
  required String text,
}) => Container(
  height: 40,
  width: width,
  child: MaterialButton(
    onPressed: (){function();},
    child: Text(isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(color: Colors.white),
    ),
  ),
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background
  ),
);
Widget defultTextButton({
  required Function function,
  required String text,
}) =>  TextButton(
    onPressed: (){function();},
    child: Text(
      text.toUpperCase(),
    ),
);
/*Widget toast() => Toast.show(state.loginModel.message,
    context,
    duration: Toast.lengthLong,
    gravity:  Toast.bottom,
    backgroundColor: Colors.red,
    textStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)
),*/

void showToast({
  required String text,
  required ToastState state
}) =>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);
enum ToastState {
  SUCCESS, ERROR, WARNING
}
Color chooseToastColor(ToastState state){
  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
case ToastState.ERROR:
color = Colors.red;
break;
case ToastState.WARNING:
color = Colors.amber;
break;
}
return color;
}
