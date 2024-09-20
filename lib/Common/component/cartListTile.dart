import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Styles/colors.dart';
import '../../constants/shopText.dart';

cartListTile({
  required String name,
  required int index,
  required BoxConstraints listCons,
}) =>
    Container(
      decoration: BoxDecoration(
        color: ShopLightColors.primaryTextColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: listCons.maxWidth * 5 / 100,
        vertical: listCons.maxHeight * 5 / 100,
      ),
      margin: EdgeInsets.symmetric(
        vertical: listCons.maxHeight * 2 / 100,
      ),
      child: LayoutBuilder(
        builder: (
          context,
          listTileCons,
        ) {
          return ListTile(
            leading: SizedBox(
              width: listTileCons.maxWidth * 75 / 100,
              child: RichText(
                text: TextSpan(
                  text: ShopText.order,
                  // softWrap: true,
                  style: TextStyle(
                    color: ShopLightColors.primaryColor,
                    fontSize: 15.h,
                  ),

                  children: [
                    TextSpan(
                      text: name,
                      style: TextStyle(
                        color: ShopLightColors.primaryTextColor,
                        fontSize: 15.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            trailing: SizedBox(
              width: listTileCons.maxWidth * 35 / 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: listTileCons.maxWidth * 1 / 100,
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Image.asset(
                          "assets/images/Cart/trash.jpg",
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: listTileCons.maxWidth * 5 / 100,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      child: Container(
                        width: listTileCons.maxWidth * 10 / 100,
                        height: listTileCons.maxWidth * 10 / 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: listTileCons.maxWidth * 1 / 100,
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            ShopText.plusOne,
                            style: const TextStyle(
                              color: Color(
                                0xFF5AE804,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
