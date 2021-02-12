import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:dro_health/utils/custom_navigation_controller.dart';
import 'package:dro_health/views/bag_view/bagdetail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BagSuccessDialog extends StatelessWidget {
  final String bagName;
  const BagSuccessDialog({@required this.bagName});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            width: size.width*0.7,
            height: size.height*0.4,
            decoration: BoxDecoration(color: DroColors.colorWhite,borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.width*0.25,),
                Text("${bagName} One Has Been Added To Your Cart",style: TextStyle(
                  fontFamily: 'proxima_bold',
                  fontSize: 12,
                  color: DroColors.colorBlack,
                )),
                const SizedBox(height: 15,),
                DialogButton(bagLabel: "View Bag",onButtonPressed: (){
                  changeScreen(context: context, widget: ChangeNotifierProvider.value(child: BagDetailView(),
                    value: HiveManagerProvider(),));
                },),
                const SizedBox(height: 15,),
                DialogButton(bagLabel: "Done",onButtonPressed: (){
                  Navigator.pop(context);
                },)
              ],
            ),
          ),
          Positioned(
            top: -(size.width*0.15),
            left: size.width*0.25,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.3,
                  height: size.width*0.3,
                  child: Center(
                    child: Icon(Icons.check,size: 30,color: DroColors.colorWhite,),
                  ),
                  decoration: BoxDecoration(color:DroColors.colorDroTortoise,shape: BoxShape.circle,border: Border.all(color: DroColors.colorWhite,width: 4),),
                ),
                Text("Successful",style: TextStyle(
                  fontFamily: 'proxima_bold',
                  fontSize: 16,
                  color: DroColors.colorBlack,
                )),
              ],
            ) ,
          )
        ],
      ),
    );
  }
}
class DialogButton extends StatelessWidget {
  final Function onButtonPressed;
  final String bagLabel;
  const DialogButton({this.bagLabel,this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        margin: EdgeInsets.only(left: size.width*0.03),
        width: size.width*0.65,
        height: size.height*0.06,
        decoration: BoxDecoration(color: DroColors.colorDroTortoise),
        child: Center(
          child:   Text(bagLabel,style: TextStyle(
            fontFamily: 'proxima_regular',
            fontSize: 12,
            color: DroColors.colorWhite,
          )),
        ),
      ),
    );
  }
}

