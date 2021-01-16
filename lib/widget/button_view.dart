import 'package:cyborgs/helper/colors_app.dart';
import 'package:flutter/material.dart';

class raisedButton extends StatelessWidget {
  double borderRadiusCircular;
  Color borderSideColor;
  Color textColor;
  Color buttonColor;
  String textButton;
  double fontSize;
  double height;
  double width;
  Function function;
  raisedButton(
      {this.height,
      this.width,
      this.borderRadiusCircular,
      this.fontSize,
      this.buttonColor,
      this.textColor,
      this.textButton,
      this.borderSideColor,
      this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 80,
      width: width ?? MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: function,
        color: buttonColor??colorThemApp,
        textColor: textColor??Colors.white,
        child: Text(textButton, style: TextStyle(fontSize: fontSize)),
      ),
    );
  }
}
