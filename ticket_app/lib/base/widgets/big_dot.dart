import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';

class BigDot extends StatelessWidget {
  final bool? isColor;
  const BigDot({super.key,this.isColor });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color:isColor==null? Colors.white:AppStyles.dotColor, width: 2.5),
        borderRadius: BorderRadius.circular(20),
        //  color: Colors.white,
      ),
    );
  }
}
