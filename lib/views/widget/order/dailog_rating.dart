 import 'package:e_commerce_app/controller/orders/archive_controller.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

 


    void showDialogRating(BuildContext context, String orderid)
    {
     showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image:  Image.asset(ImageAsset.logo,width: 200,height: 200,fit: BoxFit.fill,),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(fontWeight: FontWeight.bold),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        ArchiveOrdersControllerImp controller = Get.find();
        controller.submitRating(response.rating,response.comment,orderid);
      },
    )
    );
    }