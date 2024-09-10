import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum EnumHomePageTabs{
  home(label: "Home"),
  techStack(label: "Tech Stack"),
  projects(label: "Projects"),
  profile(label: "My Profile"),
  about(label: "About");
  final String label;
  const EnumHomePageTabs({required this.label});
}

class CHomePageController extends GetxController{

  ValueNotifier<EnumHomePageTabs> currentTab = ValueNotifier(EnumHomePageTabs.home);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  Future<void> initLoad() async{

  }

  Future<void> onChangePageEnum({required EnumHomePageTabs enumHomePageTab}) async{
    currentTab.value = enumHomePageTab;
    final pageIndex = EnumHomePageTabs.values.indexOf(enumHomePageTab);
  }

}