
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  Function function;
  ErrorView({this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Center(
        child: Text("Error Happened Try Again"),
      ),
    );
  }
}
