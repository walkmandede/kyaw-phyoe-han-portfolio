import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:json_editor/json_editor.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/_widgets/fitted_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_assets.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_colors.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_constants.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_svgs.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';

import '../d_my_profile.dart';


class WhCodeDisplayWidget extends StatelessWidget {
  final ThemeModel theme;
  const WhCodeDisplayWidget({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    final borderSideDivider = BorderSide(
      color: theme.disableColor.withOpacity(0.3),
      width: 1.5
    );
    return LayoutBuilder(
      builder: (a1, c1) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: c1.maxWidth * 0.05,
            vertical: c1.maxHeight * 0.05
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(AppAssets.imgCodeView).image,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(theme.text1.withOpacity(0.2), BlendMode.srcIn)
              )
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: c1.maxWidth * 0.075,
                  right: c1.maxWidth * 0.075,
                  top: c1.maxHeight * 0.05,
                  bottom: c1.maxHeight * 0.05
                ),
                child: AspectRatio(
                  aspectRatio: 16/9,
                  child: LayoutBuilder(
                    builder: (a2, c2) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  theme.text1.withOpacity(0.7),
                                  theme.text2.withOpacity(0.001)
                                ]
                              )
                            ),
                            child: const SizedBox.expand(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(c2.maxWidth*0.003),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: theme.background2
                              ),
                              child: SizedBox.expand(
                                child: Column(
                                  children: [
                                    //topBar
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox.expand(
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  right: borderSideDivider
                                              )
                                          ),
                                          child: LayoutBuilder(
                                            builder: (a3, c3) {
                                              return Padding(
                                                padding: EdgeInsets.all(c3.maxHeight * 0.25),
                                                child: FittedWidget(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: "Kyaw ",
                                                      style: TextStyle(
                                                        color: theme.text2,
                                                        fontFamily: AppAssets.fontMegatrans,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: "Phyoe ",
                                                          style: TextStyle(
                                                            color: theme.primary,
                                                            fontFamily: AppAssets.fontMegatrans,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: "'s Portfolio ",
                                                          style: TextStyle(
                                                            color: theme.text2,
                                                            fontFamily: AppAssets.fontMegatrans,
                                                          ),
                                                        )
                                                      ]
                                                    ),
                                                  ),
                                                )
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Row(
                                        children: [
                                          //actionsPanel
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox.expand(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        right: borderSideDivider
                                                    )
                                                ),
                                                child: LayoutBuilder(
                                                  builder: (a3, c3) {
                                                    return Padding(
                                                      padding: EdgeInsets.all(c3.maxWidth * 0.3),
                                                      child: Column(
                                                        children: [
                                                          FittedBox(
                                                            child: SvgPicture.string(
                                                              AppSvgs.folderIcon,
                                                              colorFilter: ColorFilter.mode(theme.primary, BlendMode.srcIn),
                                                            )
                                                          ),
                                                          (c3.maxHeight*0.025).heightBox(xResponsive: false),
                                                          FittedBox(
                                                              child: SvgPicture.string(
                                                                AppSvgs.debugIcon,
                                                                colorFilter: ColorFilter.mode(theme.text2, BlendMode.srcIn),
                                                              )
                                                          ),
                                                          (c3.maxHeight*0.025).heightBox(xResponsive: false),
                                                          const Spacer(),
                                                          FittedBox(
                                                              child: SvgPicture.string(
                                                                AppSvgs.gitIcon,
                                                                colorFilter: ColorFilter.mode(theme.text1, BlendMode.srcIn),
                                                              )
                                                          ),
                                                          (c3.maxHeight*0.025).heightBox(xResponsive: false),
                                                          FittedBox(
                                                              child: SvgPicture.string(
                                                                AppSvgs.settingIcon,
                                                                colorFilter: ColorFilter.mode(theme.text1, BlendMode.srcIn),
                                                              )
                                                          ),
                                                          (c3.maxHeight*0.025).heightBox(xResponsive: false),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          //folderStructure
                                          Expanded(
                                            flex: 3,
                                            child: SizedBox.expand(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        right: borderSideDivider
                                                    )
                                                ),
                                                child: LayoutBuilder(
                                                  builder: (a3, c3) {
                                                    return ListView.separated(
                                                      padding: EdgeInsets.all(c3.maxWidth * 0.05),
                                                      itemCount: 10,
                                                      separatorBuilder: (context, index) {
                                                        return Padding(
                                                          padding: EdgeInsets.only(bottom: c3.maxHeight * 0.025),
                                                        );
                                                      },
                                                      itemBuilder: (context, index) {
                                                        return AspectRatio(
                                                          aspectRatio: 8/1,
                                                          child: Builder(
                                                            builder: (context) {
                                                              if(index==0){
                                                                return SizedBox.expand(
                                                                  child: DecoratedBox(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(3),
                                                                      color: theme.text1.withOpacity(0.2)
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              else{
                                                                double nextInt = ((Random().nextInt(3)+1) * 0.2)+0.3;
                                                                return LayoutBuilder(
                                                                  builder: (a4, c4) {
                                                                    return Row(
                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                      children: [
                                                                        SizedBox(
                                                                          width: c4.maxWidth * nextInt,
                                                                          height: double.infinity,
                                                                          child: DecoratedBox(
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(3),
                                                                              color: theme.text2.withOpacity(0.1)
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          //codePanel
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              children: [
                                                //fileNavigation
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox.expand(
                                                    child: DecoratedBox(
                                                      decoration: BoxDecoration(
                                                          border: Border(
                                                              right: borderSideDivider
                                                          )
                                                      ),
                                                      child: LayoutBuilder(
                                                        builder: (a3, c3) {
                                                          return Padding(
                                                            padding: EdgeInsets.all(c3.maxHeight * 0.25),
                                                            child: Row(
                                                              children: [
                                                                FittedBox(
                                                                  child: Text(
                                                                    "code_display_widget.dart",
                                                                    style: TextStyle(
                                                                      color: theme.primary.withOpacity(0.7),
                                                                      fontSize: 12
                                                                    ),
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                FittedBox(
                                                                  child: Icon(
                                                                    Icons.play_arrow_rounded,
                                                                    color: theme.primary,
                                                                  ),
                                                                ),
                                                                (c3.maxWidth*0.01).widthBox(xResponsive: false),
                                                                FittedBox(
                                                                  child: SvgPicture.string(
                                                                    AppSvgs.debugIcon,
                                                                    colorFilter: ColorFilter.mode(theme.text2, BlendMode.srcIn),
                                                                  ),
                                                                ),
                                                                (c3.maxWidth*0.01).widthBox(xResponsive: false),
                                                                FittedBox(
                                                                  child: Icon(
                                                                    Icons.stop_rounded,
                                                                    color: theme.redDanger,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 10,
                                                  child: SizedBox.expand(
                                                    child: LayoutBuilder(
                                                      builder: (a3, c3) {
                                                        JsonTheme jsonTheme = JsonTheme(
                                                          stringStyle: TextStyle(
                                                            color: theme.primary,
                                                          ),
                                                          keyStyle: TextStyle(
                                                            color: theme.text1,
                                                            height: 2
                                                          ),
                                                          bracketStyle: TextStyle(
                                                            color: theme.text2,
                                                            height: 2
                                                          ),
                                                          defaultStyle: TextStyle(
                                                            color: theme.text2,
                                                          ),
                                                          errorStyle: TextStyle(
                                                            color: theme.redDanger
                                                          ),
                                                          boolStyle: TextStyle(
                                                            color: theme.greenSuccess
                                                          ),
                                                          numberStyle: TextStyle(
                                                            color: theme.secondaryAccent
                                                          )
                                                        );
                                                        return DecoratedBox(
                                                          decoration: BoxDecoration(
                                                            color: theme.background3,
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                              horizontal: c3.maxWidth * 0.025,
                                                              vertical: c3.maxHeight * 0.025,
                                                            ),
                                                            child: JsonEditorTheme(
                                                                themeData: JsonEditorThemeData(
                                                                  lightTheme: jsonTheme,
                                                                  darkTheme: jsonTheme
                                                                ),
                                                                child: JsonEditor.object(
                                                                  object: MyProfileData().myProfileJson,
                                                                  enabled: true,
                                                                )
                                                            ),
                                                            // child: TextField(
                                                            //   controller: TextEditingController(
                                                            //       text: jsonEncode(MyProfileData().myProfileJson)
                                                            //   ),
                                                            //   readOnly: true,
                                                            //   decoration: const InputDecoration(
                                                            //       border: InputBorder.none
                                                            //   ),
                                                            //   maxLines: null,
                                                            //   style: TextStyle(
                                                            //     color: theme.text1,
                                                            //     fontSize: 12,
                                                            //     fontFamily: AppAssets.fontUbuntu
                                                            //   ),
                                                            // ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IgnorePointer(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        theme.background1.withOpacity(0.8)
                                      ]
                                  )
                              ),
                              child: const SizedBox.expand(),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
