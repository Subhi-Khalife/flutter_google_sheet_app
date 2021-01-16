import 'package:cyborgs/helper/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';



class CachedNetworkImageView extends StatelessWidget {
  String url;
  Function function;
  CachedNetworkImageView({this.url = "", this.function});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, imageUrl) => Center(
          child: CircularProgressIndicator(
            backgroundColor: colorThemApp,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
          ),
        ),
        errorWidget: (context, imageUrl, error) => Icon(
          Icons.image,
          size: 35,
        ),
      ),
    );
  }
}
