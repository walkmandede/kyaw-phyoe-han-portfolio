import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import '../../../_services/theme_services/w_custom_theme_builder.dart';
import '../../_services/device_orientation_service/w_custom_orientation_builder.dart';
import 'c_home_page_controller.dart';
import 'wh_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CHomePageController());
    return MyOrientationBuilder(
      builder: (context, orientation, windowSize, screenSize) {
        return MyThemeBuilder(
          builder: (context, theme, themeController) {
            if(orientation == EnumAppOrientation.horizontal){
              return WhHomePage(theme: theme);
            }
            else{
              //todo change later
              return WhHomePage(theme: theme);
            }
          },
        );
      },
    );
  }
}