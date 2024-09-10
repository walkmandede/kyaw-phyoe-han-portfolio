import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/_widgets/fitted_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_assets.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_constants.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_functions.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/_home_page/c_home_page_controller.dart';
import '../../../_services/theme_services/m_theme_model.dart';

class WhNaviBarWidget extends StatelessWidget {
  final ThemeModel theme;
  const WhNaviBarWidget({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    CHomePageController controller = Get.find();
    return LayoutBuilder(
      builder: (a1, c1) {
        return Padding(
          padding: EdgeInsets.only(
            left: c1.maxWidth * 0.025,
            right: c1.maxWidth * 0.025,
            bottom: c1.maxHeight * 0.025
          ),
          child: Card(
            color: theme.background2,
            elevation: 5,
            shadowColor: theme.primary.withOpacity(0.05),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius*0.5)
            ),
            child: SizedBox.expand(
              child: LayoutBuilder(
                builder: (a2, c2) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: c2.maxHeight * 0.3,
                        vertical: c2.maxHeight * 0.3
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: controller.currentTab,
                            builder: (context, currentTab, child) {
                              return FittedWidget(
                                child: Row(
                                  children: EnumHomePageTabs.values.map((e) {
                                    bool xSelected = e == currentTab;
                                    bool xLast = EnumHomePageTabs.values.last == e;
                                    bool xFirst = EnumHomePageTabs.values.first == e;
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: xLast?Colors.transparent:theme.text1,
                                            width: 0.2
                                          )
                                        )
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: c2.maxWidth * 0.015,
                                          left: xFirst?0:c2.maxWidth * 0.01
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            vibrateNow();
                                            controller.onChangePageEnum(enumHomePageTab: e);
                                          },
                                          child: Text(
                                            e.label,
                                            style: TextStyle(
                                              color: xSelected?theme.primary:theme.text2.withOpacity(0.5),
                                              fontSize: 25,
                                              fontFamily: AppAssets.fontMegatrans
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },).toList(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
