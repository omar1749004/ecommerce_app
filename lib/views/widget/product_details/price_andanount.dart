import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class PriceAndAmount extends StatelessWidget {
  const PriceAndAmount({super.key,required this.add,required this.remove, required this.price, required this.count});
  final void Function()? add;
  final void Function()? remove;
  final String price;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
                Row(
                  children: [
                  IconButton(onPressed: add, icon: Icon(Icons.add)),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    width: 50,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Text(count,style: TextStyle(fontSize: 20),),),
                  IconButton(onPressed: remove, icon: Icon(Icons.remove))
                  ],),
                    Spacer(),
                    Text("$price \$",style: TextStyle(
                      fontSize: 25,
                      color: ColorApp.KPrimaryColor),)
                ],);
  }
}