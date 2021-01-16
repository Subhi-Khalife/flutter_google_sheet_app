import 'package:cyborgs/helper/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


 showMessage(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.values[1],
      backgroundColor: colorThemApp,
      textColor: Colors.white,
      fontSize: 15);

}


