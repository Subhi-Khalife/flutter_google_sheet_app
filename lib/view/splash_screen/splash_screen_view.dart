import 'dart:async';

import 'package:cyborgs/model/product_model.dart';
import 'package:cyborgs/view/sheet/sheet_info_view.dart';
import 'package:cyborgs/widget/error_view.dart';
import 'package:cyborgs/widget/image_view.dart';
import 'package:cyborgs/widget/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenView();
  }
}

class _SplashScreenView extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    makeDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Image.asset("assets/cyborgs.png")),
      ),
    );
  }

  makeDelay() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SheetInfoView()),
          (route) => false);
    });
  }

}
