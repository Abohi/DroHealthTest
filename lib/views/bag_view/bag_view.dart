import 'package:dro_health/models/AddBagModel.dart';
import 'package:dro_health/models/ProductModel.dart';
import 'package:dro_health/controllers/provider.dart';
import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:dro_health/views/bag_view/bag_widget/bag_header.dart';
import 'package:dro_health/views/bag_view/bag_widget/bag_success_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BagView extends StatelessWidget {
  final ProductModel productModel;
  const BagView({this.productModel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bagProvider = Provider.of<HiveManagerProvider>(context);
    return Scaffold(
      backgroundColor: DroColors.colorWhite,
      body: WillPopScope(
        onWillPop: ()async{
          return true;
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              BagHeader(
                bagIndex: bagProvider.hiveManager.getBags().length.toString(),
                onButtonPressed: (){
                Navigator.pop(context);
              },),
              SliverToBoxAdapter(
                child: Center(child: SizedBox(
                  height: size.height*0.3,
                    child: Image.asset(productModel.drugImage,fit: BoxFit.scaleDown,))),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: screenHorizontalSpacing),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productModel.drugName,style: TextStyle(
                        fontFamily: 'proxima_bold',
                        fontSize: 18,
                        color: DroColors.colorBlack,
                      ),),
                      const SizedBox(height: 10,),
                      Text(productModel.drugSizeDescription,style: TextStyle(
                        fontFamily: 'proxima_regular',
                        fontSize: 16,
                        color: DroColors.colorBlack,
                      ),),
                      const SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: DroColors.colorGray,
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("SOLD BY",style: TextStyle(
                                fontFamily: 'proxima_regular',
                                fontSize: 16,
                                color: DroColors.colorGray,
                              ),),
                              Text(productModel.soldBy,style: TextStyle(
                                fontFamily: 'proxima_bold',
                                fontSize: 18,
                                color: DroColors.colorBlack,
                              ),)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width:size.width*0.35,
                            height: size.height*0.08,
                            decoration: BoxDecoration(color: DroColors.colorWhite,border: Border.all(color: DroColors.colorGray,),borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(icon: Icon(Icons.remove,color: DroColors.colorBlack), onPressed: (){
                                bagProvider.removePack();
                                }),
                                Text(bagProvider.pack.toString(),style: TextStyle(
                                  fontFamily: 'proxima_bold',
                                  fontSize: 16,
                                  color: DroColors.colorBlack,
                                ),),
                                IconButton(icon: Icon(Icons.add,color: DroColors.colorBlack,), onPressed: (){
                                  bagProvider.addPack();
                                })
                              ],
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text("Pack(s)",style: TextStyle(
                            fontFamily: 'proxima_regular',
                            fontSize: 16,
                            color: DroColors.colorBlack,
                          ),),
                          Spacer(),
                          SizedBox(
                            width: size.width*0.08,
                            height: size.height*0.03,
                            child: Stack(
                              overflow: Overflow.visible,
                              children: [
                                Positioned(
                                    top: -12,
                                    left: -5,
                                    child:Text("N",style: TextStyle(
                                      fontFamily: 'proxima_bold',
                                      fontSize: 16,
                                      color: DroColors.colorBlack,
                                    ) ,
                                    )),
                                Positioned(
                                  left:8,
                                  child:Text(productModel.drugPrice,style: TextStyle(
                                    fontFamily: 'proxima_bold',
                                    fontSize: 16,
                                    color: DroColors.colorBlack,
                                  ) ,
                                  ) ,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 25,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("PRODUCT DETAILS",style: TextStyle(
                        fontFamily: 'proxima_bold',
                        fontSize: 18,
                        color: DroColors.colorGray,
                      )),
                          const SizedBox(height: 15,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Transform.rotate(child: Icon(Icons.smart_button_outlined,color: DroColors.colorDroPurple,size: 25,),angle: -0.85,),
                                 Transform.rotate(child: Icon(Icons.smart_button_outlined,color: DroColors.colorDroPurple,size: 25,),angle: -0.9,),
                                 const SizedBox(width:10),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                     children:[
                                       Text("PACK SIZE",style:TextStyle(
                                         fontFamily: 'proxima_bold',
                                         fontSize: 14,
                                         color: DroColors.colorGray,
                                       )),
                                       Text("${productModel.packSize}X10",style:TextStyle(
                                         fontFamily: 'proxima_bold',
                                         fontSize: 14,
                                         color: DroColors.colorBlack,
                                       )),
                                     ]
                                 ),
                               ],
                             ),
                             Row(
                               children: [
                                  Icon(Icons.fit_screen,color: DroColors.colorDroPurple,size: 30,),
                                 const SizedBox(width: 10,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("PRODUCT TO",style: TextStyle(
                                       fontFamily: 'proxima_bold',
                                       fontSize: 16,
                                       color: DroColors.colorGray,
                                     ),),
                                     Text(productModel.productTo,style: TextStyle(
                                       fontFamily: 'proxima_bold',
                                       fontSize: 16,
                                       color: DroColors.colorBlack,
                                     )),
                                   ],
                                 )
                               ],
                             )
                           ],
                         ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Transform.rotate(child: Icon(Icons.smart_button_outlined,color: DroColors.colorDroPurple,size: 25,),angle: -0.85,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("CONSTINTUENTS",style: TextStyle(
                                    fontFamily: 'proxima_bold',
                                    fontSize: 14,
                                    color: DroColors.colorGray,
                                  )),
                                  Text(productModel.drugConstituent,style: TextStyle(
                                    fontFamily: 'proxima_bold',
                                    fontSize: 14,
                                    color: DroColors.colorGray,
                                  ))
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Transform.rotate(child: Icon(Icons.work_sharp,color: DroColors.colorDroPurple,size: 25,),angle: -0.85,),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("DISPENSED BY",style: TextStyle(
                                    fontFamily: 'proxima_bold',
                                    fontSize: 14,
                                    color: DroColors.colorGray,
                                  )),
                                  Text("Packs",style: TextStyle(
                                    fontFamily: 'proxima_bold',
                                    fontSize: 14,
                                    color: DroColors.colorGray,
                                  ))
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: size.height*0.08,),
                          Center(
                            child: Text(productModel.drugSizeDescription,style: TextStyle(
                              fontFamily: 'proxima_regular',
                              fontSize: 12,
                              color: DroColors.colorGray,
                            )),
                          ),
                          SizedBox(height: size.height*0.08,),
                          AddBtn(onButtonPressed: ()async{
                            bagProvider.hiveManager.addToBag(AddBagModel(drugPrice: productModel.drugPrice,drugImage: productModel.drugImage,drugName:productModel.drugName,packs: bagProvider.pack));

                            await showGeneralDialog(context: context, pageBuilder: (context,_,__){
                              return ChangeNotifierProvider.value(child: BagSuccessDialog(bagName: productModel.drugName,),
                              value: HiveManagerProvider(),);
                            });
                          },),
                          SizedBox(height: 10,),
                        ],
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

class AddBtn extends StatelessWidget {
  final Function onButtonPressed;
  const AddBtn({this.onButtonPressed});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Center(
        child: Container(
          width: size.width*0.7,
          height: size.height*0.06,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: DroColors.colorGray.withOpacity(0.4),
                  offset: Offset(2,2),
                  blurRadius: 3,
                )
              ],
              color: DroColors.colorDroPurple,borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child: SvgPicture.asset("assets/images/shoppingbag.svg",color: DroColors.colorWhite,),
                width: 20,height: 20,),
              const SizedBox(width: 10,),
              Text("Add to bag",style: TextStyle(
                fontFamily: 'proxima_regular',
                fontSize: 12,
                color: DroColors.colorWhite,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

