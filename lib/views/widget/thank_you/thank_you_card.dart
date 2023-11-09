import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:e_commerce_app/views/widget/thank_you/card_info.dart';
import 'package:e_commerce_app/views/widget/thank_you/payment_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThankyouCard extends StatelessWidget {
  const ThankyouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      width: 350,
      // height: 672,
      decoration: ShapeDecoration(
        color: Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(children: [
        SizedBox(
          height: 50 + 16,
        ),
        Text('Thank you!', textAlign: TextAlign.center, style: Styles.style25),
        Text('Your transaction was successful',
            textAlign: TextAlign.center, style: Styles.style20),
        const SizedBox(
          height: 42,
        ),
        const PaymentInfo(left: 'Date', right: '01/24/2023'),
        const SizedBox(
          height: 20,
        ),
        const PaymentInfo(left: 'Time', right: '10:15 AM'),
        const SizedBox(
          height: 20,
        ),
        const PaymentInfo(left: 'To', right: 'Sam Louis'),
        const Divider(
          thickness: 2,
          color: Color(0xFFC6C6C6),
          height: 60,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Price", style: Styles.style18),
            Text('500 \$', style: Styles.style18)
          ],
        ),
       const SizedBox(
          height: 30,
        ),
      const  CardInfo(),
      Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(CupertinoIcons.barcode ,size: 70,),
            Container(
              width: 113,
              height: 58,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child:  Text(
                  'PAID',
                  textAlign: TextAlign.center,
                  style: Styles.style25.copyWith(
                   color:const Color(0xFF34A853),
                  )
                ),
              ),
            )
          ],
        ),
        SizedBox(height: ((MediaQuery.sizeOf(context).height * .2 +20 ) / 2) -30,)
      ]),
    );
  }
}
