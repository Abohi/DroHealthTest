import 'package:dro_health/styles/dimens.dart';
import 'package:dro_health/styles/dro_colors.dart';
import 'package:flutter/material.dart';

class StoreHeader2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SliverAppBar(
      titleSpacing: 0,
      elevation: 0,
      automaticallyImplyLeading: false,
      collapsedHeight: size.height * 0.18,
      flexibleSpace: Container(
        width: size.width,
        height: size.height * 0.18,
        padding: EdgeInsets.symmetric(horizontal: screenHorizontalSpacing),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubHeaderIcon(headerIcon: Icons.arrow_downward_outlined),

                SubHeaderIcon(headerIcon: Icons.science_outlined),

                SubHeaderIcon(headerIcon: Icons.search),
              ],
            ),
            SizedBox(height: 15,),
            const SearchWidget()
          ],
        )
      ),
      backgroundColor: DroColors.colorWhite,
      pinned: true,
      centerTitle: false,
    );
  }
}
class SubHeaderIcon extends StatelessWidget {
  final IconData headerIcon;
  const SubHeaderIcon({@required this.headerIcon});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.12,
      height: size.width*0.12,
      decoration: BoxDecoration(shape: BoxShape.circle,color: DroColors.colorGray.withOpacity(0.2)),
      child: Center(
        child: Icon(headerIcon,size: 18,color: DroColors.colorGray,),
      ),
    );
  }
}
class SearchWidget extends StatelessWidget {
  const SearchWidget();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width*0.13,
      decoration: BoxDecoration(border: Border.all(color: DroColors.colorGray,),borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Icon(Icons.search,size: 18,color: DroColors.colorGray,),
          const SizedBox(width: 10,),
          Expanded(
            child: TextField(
              style: new TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: new TextStyle(color: DroColors.colorBlack)
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Icon(Icons.clear,size: 18,color: DroColors.colorGray,),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}

