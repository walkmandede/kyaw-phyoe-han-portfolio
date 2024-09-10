import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/_widgets/fitted_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/models/m_project_model.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/c_projects_page_controller.dart';

class EachProjectTabWidget extends StatelessWidget {
  final ThemeModel theme;
  final ProjectModel projectModel;
  const EachProjectTabWidget({super.key,required this.theme,required this.projectModel});

  @override
  Widget build(BuildContext context) {
    CProjectsPageController controller = Get.find();
    final bool xSelected = controller.selectedProject.value == projectModel;
    return GestureDetector(
      onTap: () {
        controller.onChangeSelectedProject(projectModel: projectModel);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.005
        ),
        child: AspectRatio(
          aspectRatio: 3/1,
          child: SizedBox.expand(
            child: LayoutBuilder(
              builder: (a1, c1) {
                return Stack(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                xSelected?theme.text1:theme.disableColor,
                                theme.text2.withOpacity(0.015)
                              ]
                          )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(c1.maxWidth * 0.01),
                        child: SizedBox.expand(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: theme.background2
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: c1.maxWidth * 0.1,
                                  vertical: c1.maxHeight * 0.25
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: Image.asset(projectModel.appIcon).image
                                        )
                                      ),
                                      child: const SizedBox.expand(),
                                    ),
                                  ),
                                  (c1.maxWidth*0.025).widthBox(xResponsive: false),
                                  Expanded(
                                    flex: 2,
                                    child: FittedWidget(
                                      child: Text(
                                        projectModel.appName,
                                        style: TextStyle(
                                            color: xSelected?theme.text1:theme.disableColor,
                                            fontSize: 25
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                theme.background1.withOpacity(0.1),
                                theme.background1.withOpacity(0.7),
                              ]
                          )
                      ),
                      child: const SizedBox.expand(),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
