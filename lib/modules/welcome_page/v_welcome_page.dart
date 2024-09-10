import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/device_orientation_service/c_orientation_controller.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/others/extensions.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';
import 'package:kyaw_phyoe_han_portfolio/modules/welcome_page/wh_welcome_page.dart';

class WelcomePage extends StatelessWidget {
  final ThemeModel theme;
  const WelcomePage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    if(xHorizontalOrientation()){
      return WhWelcomePage(theme: theme);
    }
    else{
      //todo
      return WhWelcomePage(theme: theme);
    }
  }
}
