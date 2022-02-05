import 'package:captain_api/constant.dart';
import 'package:captain_api/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GlobalComponents {
  //for text style
  static TextStyle buildTextStyle(TextStyle? textStyle,
      {FontWeight fontWeight = FontWeight.w400,
      bool muted = false,
      bool xMuted = false,
      double letterSpacing = 0.15,
      Color? color,
      TextDecoration decoration = TextDecoration.none,
      double? height,
      double wordSpacing = 0,
      double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle!.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle!.color!.withAlpha(160)
          : (muted ? textStyle!.color!.withAlpha(200) : textStyle!.color);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.ibmPlexSans(
        fontSize: finalFontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  //for rating
  static Widget buildRatingStar(
      {double rating = 5,
        Color activeColor = ColorConfig.starColor,
        Color inactiveColor = Colors.black,
        double? size = 16,
        double spacing = 0,
        bool inactiveStarFilled = false,
        bool showInactive = true}) {
    int ratingCount = rating.floor();
    bool isHalf = (ratingCount != rating);
    List<Widget> _stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < ratingCount) {
        _stars.add(Icon(
          MdiIcons.star,
          color: activeColor,
          size: size,
        ));

        _stars.add(SizedBox(width: spacing));
      } else {
        if (isHalf) {
          isHalf = false;
          _stars.add(Icon(
            MdiIcons.starHalfFull,
            color: activeColor,
            size: size,
          ));
        } else if (showInactive) {
          _stars.add(Icon(
            inactiveStarFilled ? MdiIcons.star : MdiIcons.starOutline,
            color: inactiveColor,
            size: size,
          ));
        }
        _stars.add(SizedBox(width: spacing));
      }
    }
    return Row(mainAxisSize: MainAxisSize.min, children: _stars);
  }
}

//for category
class CategoryWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;
  final bool isSelected;

  const CategoryWidget(
      {Key? key,
      required this.iconData,
      required this.actionText,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: SizeConfig.size12, bottom: SizeConfig.size12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: isSelected
                  ? ColorConfig.primary
                  : ColorConfig.primary.withAlpha(20),
              child: SizedBox(
                  width: SizeConfig.size52,
                  height: SizeConfig.size52,
                  child: Icon(
                    iconData,
                    color: isSelected
                        ? ColorConfig.onPrimary
                        : ColorConfig.primary,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.size8),
            child: Text(
              actionText,
              style: GlobalComponents.buildTextStyle(Get.textTheme.caption,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0,
                  color: Colors.black87),
            ),
          )
        ],
      ),
    );
  }
}

//for products
class ProductWidget extends StatelessWidget {
  //const ProductWidget({Key? key}) : super(key: key);

  var imageUrl;
  var name;
  var ratting;
  var store;
  var price;
  var favourite;
  ProductWidget(this.imageUrl, this.name, this.ratting, this.store, this.price,
      this.favourite);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.size15),
      decoration: BoxDecoration(
        color: ColorConfig.background,
        borderRadius: BorderRadius.all(Radius.circular(SizeConfig.size8)),
        boxShadow: [
          BoxShadow(
            color: ColorConfig.shadowColor.withAlpha(26),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(SizeConfig.size16),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.size8)),
            child: Image.asset(
              imageUrl,
              height: SizeConfig.size90,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              height: SizeConfig.size90,
              margin: EdgeInsets.only(left: SizeConfig.size16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(name,
                          style: GlobalComponents.buildTextStyle(
                              Get.textTheme.subtitle1,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0)),
                      Icon(
                        MdiIcons.heart,
                        color:favourite?ColorConfig.favouriteColor:
                        ColorConfig.onBackground.withAlpha(80),
                        size: 22,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      GlobalComponents.buildRatingStar(
                        rating: ratting,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: SizeConfig.size4),
                        child: Text(ratting.toString(),
                            style: GlobalComponents.buildTextStyle(
                                Get.textTheme.bodyText1,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            MdiIcons.storeOutline,
                            color: ColorConfig.onBackground.withAlpha(80),
                            size: SizeConfig.size20,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: SizeConfig.size4),
                            child: Text(
                              store,
                              style: GlobalComponents.buildTextStyle(
                                  Get.textTheme.bodyText2,
                                  color: ColorConfig.onBackground
                                      .withAlpha(80),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      Text(
                        "\$ " + price.toString(),
                        style: GlobalComponents.buildTextStyle(
                            Get.textTheme.bodyText2,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



