import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_services/theme_services/m_theme_model.dart';

class WvHomePage extends StatelessWidget {
  final ThemeModel theme;
  const WvHomePage({super.key,required this.theme});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (a1, c1) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: theme.background1
          ),
          child: const Placeholder(),
        );
      },
    );
  }
}
