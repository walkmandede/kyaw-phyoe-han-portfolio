import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_assets.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_constants.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/welcome_page/_widgets/wh_code_display_widget.dart';

import '../../_common/_widgets/fitted_widget.dart';

class WhWelcomePage extends StatelessWidget {
  final ThemeModel theme;
  const WhWelcomePage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (a1, c1) {
          return Column(
            children: [
              Expanded(
                flex: 2,
                child: LayoutBuilder(
                  builder: (a2, c2) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: c2.maxWidth * AppConstants.baseHomePaddingFactor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: FittedWidget(
                              mainAxisAlignment: MainAxisAlignment.start,
                              child: RichText(
                                text: TextSpan(
                                    text: "A passionate Flutter developer\nwho loves to ",
                                    style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 40,
                                        color: theme.text1
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "build applications ",
                                          style: TextStyle(
                                              color: theme.primary
                                          )
                                      ),
                                      TextSpan(
                                          text: "on every screen!",
                                          style: TextStyle(
                                              color: theme.text1
                                          )
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: c2.maxWidth * 0.15,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Padding(
                                      padding: EdgeInsets.all(c2.maxHeight*0.01),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: Image.asset(AppAssets.imgMyProfile).image,
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FittedWidget(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Kyaw Phyoe Han",
                                          style: TextStyle(
                                              color: theme.primary,
                                              fontSize: 20
                                          ),
                                        ),
                                        Text(
                                          "Flutter Developer | Android Java Developer |\nML Enthusiast",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: theme.text2,
                                              fontSize: 13
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              (c1.maxHeight*0.025).heightBox(xResponsive: false),
              Expanded(
                flex: 10,
                child: WhCodeDisplayWidget(
                  theme: theme,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
