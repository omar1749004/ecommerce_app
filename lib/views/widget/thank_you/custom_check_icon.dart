import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(backgroundColor: Color(0xFFD9D9D9),
    radius: 50,
    child: CircleAvatar(backgroundColor: ColorApp.KPrimaryColor,
    radius: 40,
    child: Icon(Icons.check ,color: Colors.white,size: 50,),
    )
    ,);
  }
}

