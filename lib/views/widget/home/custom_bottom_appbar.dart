  import 'package:flutter/material.dart';

class CustommBottomAppBar extends StatelessWidget {
  const CustommBottomAppBar({super.key, 
 required this.onPressed,
  required this.icon, 
  required this.text,
   required this.color, });
   final void Function()? onPressed;
   final IconData icon;
   final String text;
   final Color color ;
 
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                        onPressed: onPressed,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(icon,color:color ,),
                            Text(text,style: TextStyle(color: color),),
                          ],
                        ),
                      );
  }
}