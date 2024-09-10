import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/_widgets/fitted_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_functions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/_home_page/c_home_page_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/v_project_page.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/welcome_page/v_welcome_page.dart';

import '_widgets/wh_navi_bar_widget.dart';

class WhHomePage extends StatelessWidget {
  final ThemeModel theme;
  const WhHomePage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    CHomePageController controller = Get.find();
    return Scaffold(
      body: LayoutBuilder(
        builder: (a1, c1) {
          return DecoratedBox(
            decoration: BoxDecoration(
                color: theme.background1
            ),
            child: Column(
              children: [
                (c1.maxHeight*0.0125).heightBox(xResponsive: false),
                Expanded(
                  flex: 1,
                  child: WhNaviBarWidget(theme: theme,),
                ),
                (c1.maxHeight*0.025).heightBox(xResponsive: false),
                Expanded(
                  flex: 13,
                  child: ValueListenableBuilder(
                    valueListenable: controller.currentTab,
                    builder: (context, currentTab, child) {
                      switch(currentTab){
                        case EnumHomePageTabs.home:
                          return WelcomePage(theme: theme);
                        case EnumHomePageTabs.techStack:
                          return const Placeholder();
                        case EnumHomePageTabs.projects:
                          return ProjectPage(theme: theme);
                        case EnumHomePageTabs.profile:
                          return const Placeholder();
                        case EnumHomePageTabs.about:
                          return const Placeholder();
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
