import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_assets.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_constants.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_functions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/_home_page/c_home_page_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/_widgets/w_each_proejct_tab_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/_widgets/wh_each_project_detail_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/c_projects_page_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/welcome_page/_widgets/wh_code_display_widget.dart';

import '../../_common/_widgets/fitted_widget.dart';

class WhProjectPage extends StatelessWidget {
  final ThemeModel theme;
  const WhProjectPage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    CProjectsPageController controller = Get.find();
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (a1, c1) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: c1.maxHeight * AppConstants.baseHomePaddingFactor,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: c1.maxHeight * 0.15,
                        width: double.infinity,
                        child: FittedWidget(
                          mainAxisAlignment: MainAxisAlignment.center,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Proudly developed",
                              style: TextStyle(
                                color: theme.text1,
                                fontFamily: AppAssets.fontMegatrans,
                                fontSize: 40
                              ),
                              children: [
                                TextSpan(
                                  text: " {projects}\n",
                                  style: TextStyle(
                                    color: theme.primary
                                  )
                                ),
                                TextSpan(
                                  text: " throughout my career.",
                                  style: TextStyle(
                                    color: theme.text1
                                  )
                                )
                              ]
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: c1.maxHeight * 0.22,
                        width: double.infinity,
                        child: ValueListenableBuilder(
                          valueListenable: controller.allProjects,
                          builder: (context, allProjects, child) {
                            return ValueListenableBuilder(
                              valueListenable: controller.selectedProject,
                              builder: (context, selectedProject, child) {
                                return Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: LayoutBuilder(
                                        builder: (a2, c2) {
                                          return ListView.builder(
                                            controller: controller.topScrollController,
                                            itemCount: 8,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0,
                                                horizontal: Get.width * 0.01
                                            ),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              final eachProject = allProjects[index];
                                              return EachProjectTabWidget(theme: theme,projectModel: eachProject,);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: LayoutBuilder(
                                        builder: (a2, c2) {
                                          return Transform.translate(
                                            offset: Offset(0,-c2.maxHeight * 0.1),
                                            child: ListView.builder(
                                              controller: controller.botScrollController,
                                              itemCount: 7,
                                              padding: EdgeInsets.symmetric(
                                                vertical: 0,
                                                horizontal: Get.width * 0.01
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                final eachProject = allProjects[8+index];
                                                return EachProjectTabWidget(theme: theme,projectModel: eachProject,);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: controller.animationController,
                  builder: (context, child) {
                    double animatedValue = controller.animationController.value;
                    return Opacity(
                      opacity: animatedValue,
                      child: SizedBox(
                        height: c1.maxHeight * 0.5 * animatedValue,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: c1.maxWidth * (AppConstants.baseHomePaddingFactor),
                            right: c1.maxWidth * (AppConstants.baseHomePaddingFactor),
                            top: c1.maxHeight * 0.025,
                            bottom: c1.maxWidth * 0.0025,
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: controller.selectedProject,
                            builder: (context, selectedProject, child) {
                              if(selectedProject==null){
                                return const SizedBox.shrink();
                              }
                              else{
                                return EachProjectDetailWidget(theme: theme,projectModel: selectedProject,);
                              }
                            },
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
