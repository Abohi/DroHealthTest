import 'package:dro_health/styles/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BagHeader extends StatelessWidget {
  final String bagIndex;
  final Function onButtonPressed;
  const BagHeader({this.onButtonPressed,this.bagIndex});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverAppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 3,
      leading: IconButton(
        onPressed: (){
          onButtonPressed();
        },
        icon: Icon(Icons.arrow_back,color: DroColors.colorBlack,),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: size.width*0.2,
            height: size.height*0.06,
            decoration: BoxDecoration(color: DroColors.colorDroPurple,borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(child: SvgPicture.asset("assets/images/shoppingbag.svg",color: DroColors.colorWhite,),
                width: size.width*0.05,
                height: size.height*0.07,),
                const SizedBox(width: 5,),
                Text(bagIndex??"", style:TextStyle(
                  fontFamily: 'proxima_regular',
                  fontSize: 18,
                  color: DroColors.colorWhite,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
