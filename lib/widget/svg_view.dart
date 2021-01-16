import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum StateType {
  assets,
  network,
}

class SvgPictureView extends StatelessWidget {
  String svgPath;
  double width ;
  double height ;
  BoxFit fit;
  Color coloSvg ;
  Function function ;
  Alignment alignment;
  StateType stateType ;
  SvgPictureView({@required this.svgPath ,@required this.stateType,
    this.alignment, this.width ,this.height ,
    this.function ,this.fit ,this.coloSvg,});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function ,
      child:stateType==StateType.assets?
      SvgPicture.asset(svgPath,height: height,
        alignment: alignment ?? Alignment.center,fit: fit ?? BoxFit.contain,
        width: width,color: coloSvg,):
      SvgPicture.network(svgPath,height: height,
        alignment: alignment ?? Alignment.center,fit: fit ?? BoxFit.contain,
        width: width,color: coloSvg,),
    );
  }
}