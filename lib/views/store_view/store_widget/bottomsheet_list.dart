import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bagProvider = Provider.of<HiveManagerProvider>(context);
    return Expanded(
      flex: 1,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context,index){
      return ListItems(drugImage: AssetImage(bagProvider.hiveManager.getBags().elementAt(index).drugImage??"assets/images/emcap.png",),drugName: bagProvider.hiveManager.getBags().elementAt(index).drugName,drugPrice: bagProvider.hiveManager.getBags().elementAt(index).drugPrice,packs: bagProvider.hiveManager.getBags().elementAt(index).packs,);
      },itemCount: bagProvider.hiveManager.getBags().length,),
    );
  }
}
class ListItems extends StatelessWidget {
  final AssetImage drugImage;
  final String drugName,drugPrice;
  final int packs;
  const ListItems({this.drugImage,this.drugName,this.packs,this.drugPrice});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.1,
      padding: EdgeInsets.only(bottom: 10,left: screenHorizontalSpacing,right: screenHorizontalSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: size.width*0.2,
            height: size.width*0.2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
        color: DroColors.colorWhite),
            child: Center(
              child: Container(
                width: size.width*0.15,
                height: size.width*0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image: DecorationImage(image:drugImage)),
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Text("${packs.toString()??""}X",style: TextStyle(
            fontFamily: 'proxima_regular',
            fontSize: 18,
            color: DroColors.colorWhite,
          ),),
          const SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(drugName??"",style: TextStyle(
                fontFamily: 'proxima_bold',
                fontSize: 18,
                color: DroColors.colorWhite,
              ),),
              Text("Capsule",style: TextStyle(
                fontFamily: 'proxima_regular',
                fontSize: 18,
                color: DroColors.colorWhite,
              ),),
            ],
          ),
          Spacer(),
          Text(drugPrice??"",style: TextStyle(
            fontFamily: 'proxima_bold',
            fontSize: 18,
            color: DroColors.colorWhite,
          ),)
        ],
      ),
    );
  }
}
