
import 'package:dro_health/models/ProductModel.dart';
import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:dro_health/utils/custom_navigation_controller.dart';
import 'package:dro_health/views/bag_view/bag_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productListProvider = Provider.of<HiveManagerProvider>(context);
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: screenHorizontalSpacing),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3/4.5,
        crossAxisCount:2,
        children:_products(productListProvider.hiveManager.getProductList(),context)
      ),
    );
  }
  List<Widget>_products(List<ProductModel> productList,BuildContext context){
    return productList.map((e) => StoreItems(onButtonPressed: (){
      changeScreen(context: context, widget: ChangeNotifierProvider.value(
        value: HiveManagerProvider(),
          child: BagView(productModel: e,)));
    },productModel: e ,)).toList();
  }
}

class StoreItems extends StatelessWidget {
  final ProductModel productModel;
  final Function onButtonPressed;
  const StoreItems({this.productModel,this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        decoration: BoxDecoration(color: DroColors.colorWhite,borderRadius: BorderRadius.circular(15),boxShadow: [
          BoxShadow(color: DroColors.colorGray.withOpacity(0.5),offset: Offset(3,3),blurRadius: 3)
        ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Center(child: Image.asset(productModel.drugImage,fit: BoxFit.scaleDown,))),
              Text(productModel.drugName,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),),
              Text(productModel.drugConstituent,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),),
              Text(productModel.drugSizeDescription,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width*0.2,
                    height: size.width*0.08,
                    decoration: BoxDecoration(color: DroColors.colorGray.withOpacity(0.8),borderRadius: BorderRadius.circular(25)),
                    child: Center(child: Text(productModel.drugPrice,style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: DroColors.colorWhite)),)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

