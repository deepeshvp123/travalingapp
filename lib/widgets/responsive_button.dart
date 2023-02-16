import 'package:flutter/material.dart';

import 'package:travalingapp/misc/colors.dart';
import 'package:travalingapp/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  // String text;
  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
    // this.text = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
       Flexible(
        child: Container(
          width: isResponsive == true? double.maxFinite : width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive==true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 5,
              ),
               isResponsive==true? AppText(text: "Book Trip Now",color:Colors.white):Container(),
              Image.asset("assets/images/button-one.png")
            ],
          ),
        ),
      
    );
  }
}
