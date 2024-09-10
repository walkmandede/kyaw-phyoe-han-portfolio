import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_assets.dart';
import 'package:kyaw_phyoe_han_portfolio/_common/constants/app_functions.dart';

import '../../_common/models/m_project_model.dart';

class CProjectsPageController extends GetxController with GetSingleTickerProviderStateMixin{

  ValueNotifier<ProjectModel?> selectedProject = ValueNotifier(null);
  ValueNotifier<List<ProjectModel>> allProjects = ValueNotifier([]);
  late AnimationController animationController;

  ScrollController topScrollController = ScrollController();
  ScrollController botScrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }


  Future<void> initLoad() async{
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    await getAllProjects();
    await Future.delayed(const Duration(milliseconds: 300));
    topScrollController.animateTo(topScrollController.position.maxScrollExtent/2, duration: const Duration(milliseconds: 600), curve: Curves.linear);
    botScrollController.animateTo(botScrollController.position.maxScrollExtent/2, duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }

  Future<void> getAllProjects() async{
    allProjects.value = [];
    try{
      allProjects.value = [
        //l2e
        ProjectModel(
            appName: "L2E Myanmar\nOnline LMS application",
            appIcon: "assets/images/projects_logo/l2e_logo.webp",
            playStoreLink: "https://play.google.com/store/apps/details?id=com.xsphere.e_learning",
            appStoreLink: "https://apps.apple.com/us/app/l2e-myanmar/id1626038880",
            description: """L2E Myanmar is an application for those students who are willing to study through E-learning.


E-learning, also referred to as online learning or electronic learning, is the acquisition of knowledge which takes place through electronic technologies and media. In simple language, e-learning is defined as “learning that is enabled electronically”. Typically, e-learning is conducted on the Internet, where students can access their learning materials online at any place and time. E-Learning most often takes place in the form of online courses, online degrees, or online programs. There are many e-learning examples out there, and we’ve covered those in greater detail in our previous articles.""",
            screenshots: [
              "assets/images/projects_logo/l2e_ss1.webp",
              "assets/images/projects_logo/l2e_ss2.webp",
              "assets/images/projects_logo/l2e_ss3.webp",
              "assets/images/projects_logo/l2e_ss5.png",
            ]
        ),
        ...List.generate(15, (index) {
          return ProjectModel(
            appName: "Sanpya Express${index+1}",
            appIcon: "assets/images/projects_logo/l2e_logo.webp",
            playStoreLink: "https://play.google.com/store/apps/editorial?id=mc_games_editorialmd_pokemon_trading_card_game_pocket_prereg_fcp&hl=en",
            appStoreLink: "https://play.google.com/store/apps/editorial?id=mc_games_editorialmd_pokemon_trading_card_game_pocket_prereg_fcp&hl=en",
            description: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.",
            screenshots: [
              "assets/images/projects_logo/l2e_ss_1.webp",
              "assets/images/projects_logo/l2e_ss_1.webp",
              "assets/images/projects_logo/l2e_ss_1.webp",
              "assets/images/projects_logo/l2e_ss_1.webp",
              "assets/images/projects_logo/l2e_ss_1.webp",
              "assets/images/projects_logo/l2e_ss_1.webp",
            ]
          );
        },)
      ];
    }
    catch(e1,e2){
      saveLogFromException(e1, e2);
    }
  }

  Future<void> onChangeSelectedProject({required ProjectModel projectModel}) async{
    if(!animationController.isAnimating){
      await animationController.reverse();
      await Future.delayed(const Duration(milliseconds: 50));
      if(projectModel==selectedProject.value){
        selectedProject.value = null;
      }
      else{
        selectedProject.value = projectModel;
        await animationController.forward();
      }
    }
  }

}