import 'dart:isolate';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/_widgets/fitted_widget.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_constants.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_functions.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/models/m_project_model.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/overlays_services/dialog/dialog_service.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/c_projects_page_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class EachProjectDetailWidget extends StatelessWidget {
  final ThemeModel theme;
  final ProjectModel projectModel;
  const EachProjectDetailWidget({super.key,required this.theme,required this.projectModel});

  @override
  Widget build(BuildContext context) {
    CProjectsPageController controller = Get.find();
    return LayoutBuilder(
      builder: (a1, c1) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: LayoutBuilder(
                builder: (a2, c2) {
                  return Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: Image.asset(projectModel.appIcon).image
                            )
                          ),
                        ),
                      ),
                      (c2.maxWidth*0.01).widthBox(xResponsive: false),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FittedWidget(
                                child: Text(
                                  projectModel.appName,
                                  style: TextStyle(
                                    color: theme.text1,
                                    fontSize: 30
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedWidget(
                                child: Row(
                                  children: [
                                    Text(
                                      "Playstore Link : ",
                                      style: TextStyle(
                                        color: theme.text2
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async{
                                        vibrateNow();
                                        if(projectModel.playStoreLink!=null){
                                          try{
                                            await launchUrl(Uri.parse(projectModel.playStoreLink!));
                                          }
                                          catch(e1,e2){
                                            superPrint(e1);
                                            saveLogFromException(e1, e2);
                                          }
                                        }
                                      },
                                      child: Text(
                                        projectModel.playStoreLink??"-",
                                        style: TextStyle(
                                          color: theme.secondaryAccent
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedWidget(
                                child: Row(
                                  children: [
                                    Text(
                                      "Appstore Link  : ",
                                      style: TextStyle(
                                          color: theme.text2
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async{
                                        vibrateNow();
                                        if(projectModel.appStoreLink!=null){
                                          try{
                                            await launchUrl(Uri.parse(projectModel.appStoreLink!));
                                          }
                                          catch(e1,e2){
                                            superPrint(e1);
                                            saveLogFromException(e1, e2);
                                          }
                                        }
                                      },
                                      child: Text(
                                        projectModel.appStoreLink??"-",
                                        style: TextStyle(
                                            color: theme.secondaryAccent
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            (c1.maxHeight * 0.025).heightBox(xResponsive: false),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: TextEditingController(text: projectModel.description*29),
                      readOnly: true,
                      maxLines: null,
                      style: TextStyle(
                        color: theme.text1
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  (c1.maxWidth * 0.01).widthBox(xResponsive: false),
                  Expanded(
                    flex: 3,
                    child: ListView.separated(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: projectModel.screenshots.length,
                      separatorBuilder: (context, index) {
                        return (c1.maxWidth * 0.005).widthBox(xResponsive: false);
                      },
                      itemBuilder: (context, index) {
                        final eachSs = projectModel.screenshots[index];
                        return GestureDetector(
                          onTap: () {
                            vibrateNow();
                            try{
                              Get.dialog(
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Image.asset(eachSs),
                                )
                              );
                            }
                            catch(e1,e2){
                              saveLogFromException(e1, e2);
                            }
                          },
                          child: AspectRatio(
                            aspectRatio: 9/16,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius),
                                border: Border.all(
                                  color: theme.text2.withOpacity(1)
                                ),
                                image: DecorationImage(
                                  image: Image.asset(eachSs).image,
                                  fit: BoxFit.fill
                                )
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
