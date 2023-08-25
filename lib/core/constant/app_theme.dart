import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish =ThemeData(
         primarySwatch:  Colors.deepPurple,
         appBarTheme:AppBarTheme(
          backgroundColor: ColorApp.KPrimaryColor,
        centerTitle: true,
        elevation: 0,
         ) ,
         floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ColorApp.KPrimaryColor),
         fontFamily: "Pacifico-Regular",
         
      );
ThemeData themeArabic =ThemeData(
         primarySwatch:  Colors.deepPurple,
         appBarTheme: AppBarTheme(backgroundColor: ColorApp.KPrimaryColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: ColorApp.KPrimaryColor),

         fontFamily: "Cairo-Medium"
        
      );