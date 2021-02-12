import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:dro_health/models/ProductModel.dart';
import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:dro_health/views/bag_view/bagdetail_view.dart';
import 'package:dro_health/views/store_view/store_widget/bottomsheet_list.dart';
import 'package:dro_health/views/store_view/store_widget/store_header1.dart';
import 'package:dro_health/views/store_view/store_widget/store_header2.dart';
import 'package:dro_health/views/store_view/store_widget/store_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreView extends StatelessWidget {
  const StoreView();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bagProvider = Provider.of<HiveManagerProvider>(context);
    return DraggableBottomSheet(

      backgroundWidget: Scaffold(
        backgroundColor: DroColors.colorWhite,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              StoreHeader1(onButtonPressed: (){

              },),
              StoreHeader2(),
              StoreList(),
              SliverToBoxAdapter(
                child: SizedBox(height: size.height*0.25,),
              )
            ],
          ),
        ),
      ),
      previewChild: Scaffold(
        body: Container(
          width: size.width,
          padding: EdgeInsets.only(top: 4,bottom: 8),
          decoration: BoxDecoration(
              color: DroColors.colorDroPurple,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
                SizedBox(height: 4,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/shoppingbag.svg",color: DroColors.colorWhite,width: 35,height: 35,),
                          Text("Bag",style: TextStyle(
                            fontFamily: 'proxima_bold',
                            fontSize: 18,
                            color: DroColors.colorWhite,
                          ),)
                        ],
                      ),
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
                )
              ],
            ),
          ),
        ),
      ),
      expandedChild: BagDetailView(),
      minExtent: 150,
      maxExtent: size.height,
    );
  }
}


