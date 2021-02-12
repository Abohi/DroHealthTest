import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:dro_health/views/store_view/store_widget/bottomsheet_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BagDetailView extends StatelessWidget {
  double total=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bagProvider = Provider.of<HiveManagerProvider>(context);

    bagProvider.hiveManager.getBags().forEach((element) {
      total+=double.parse(element.drugPrice);
    });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: ()async{
          return true;
        },
        child: Container(
          width: size.width,
          height: size.height,
          margin: MediaQuery.of(context).padding,
          decoration: BoxDecoration(
              color: DroColors.colorDroPurple,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 6,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/shoppingbag.svg",color: DroColors.colorWhite,width: 35,height: 35,),
                        const SizedBox(width: 10,),
                        Text("Bag",style: TextStyle(
                          fontFamily: 'proxima_bold',
                          fontSize: 18,
                          color: DroColors.colorWhite,
                        ),)
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: size.width*0.15,
                      height: size.width*0.15,
                      decoration: BoxDecoration(shape: BoxShape.circle,color: DroColors.colorWhite),
                      child: Center(
                        child: Text(bagProvider.hiveManager.getBags().length.toString()??"",style: TextStyle(
                          fontFamily: 'proxima_bold',
                          fontSize: 14,
                          color: DroColors.colorDarkPurple,
                        ),),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height*0.06,),
              Container(
                width: size.width*0.75,
                height: size.height*0.06,
                margin: EdgeInsets.symmetric(horizontal: size.height*0.07),
                decoration: BoxDecoration(color: DroColors.colorWhite,borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text("Tap on an item, for add,remove,delete option",style: TextStyle(
                    fontFamily: 'proxima_bold',
                    fontSize: 12,
                    color: DroColors.colorBlack,
                  ),),
                ),
              ),
              BottomSheetList(),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: screenHorizontalSpacing),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(
                            fontFamily: 'proxima_bold',
                            fontSize: 18,
                            color: DroColors.colorWhite,
                          ),),
                          Text("N${total}",style: TextStyle(
                            fontFamily: 'proxima_bold',
                            fontSize: 18,
                            color: DroColors.colorWhite,
                          ),)
                        ],
                      ),
                      SizedBox(height: size.height*0.02,),
                      Center(
                        child: Container(
                          width: size.width*0.7,
                          height: size.height*0.07,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: DroColors.colorGray.withOpacity(0.5),offset: Offset(3,3),blurRadius: 3)
                              ],
                              color: DroColors.colorWhite,borderRadius: BorderRadius.circular(25)),
                          child:  Center(
                            child: Text("Checkout",style: TextStyle(
                              fontFamily: 'proxima_regular',
                              fontSize: 18,
                              color: DroColors.colorBlack,
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
