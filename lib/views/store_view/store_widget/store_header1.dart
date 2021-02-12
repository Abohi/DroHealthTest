import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StoreHeader1 extends StatelessWidget {
  final onButtonPressed;
  const StoreHeader1({this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var productListProvider = Provider.of<HiveManagerProvider>(context);
    return  SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 3,
      leading: IconButton(
        onPressed: (){
          onButtonPressed();
        },
        icon: Icon(Icons.arrow_back,color: DroColors.colorBlack,),
      ),
      title: Text("${productListProvider.hiveManager.getProductList().length} Item(s)", style:GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: DroColors.colorBlack))),
    );
  }
}
