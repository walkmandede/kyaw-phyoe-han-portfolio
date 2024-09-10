import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/c_projects_page_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/projects_page/wh_project_page.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/welcome_page/wh_welcome_page.dart';

class ProjectPage extends StatelessWidget {
  final ThemeModel theme;
  const ProjectPage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    //todo
    // Get.delete<CProjectsPageController>();
    Get.put(CProjectsPageController());
    if(xHorizontalOrientation()){
      return WhProjectPage(theme: theme);
    }
    else{
      //todo
      return WhProjectPage(theme: theme);
    }
  }
}
