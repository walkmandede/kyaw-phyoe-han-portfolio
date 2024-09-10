import 'package:flutter/material.dart';
import 'package:get/get.dart';
enum EnumAppOrientation{
  horizontal,
  vertical
}

class OrientationController extends GetxController{

  ValueNotifier<EnumAppOrientation> currentOrientation = ValueNotifier(EnumAppOrientation.horizontal);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  Future<void> initLoad() async{

  }

  void setOrientation({required EnumAppOrientation enumAppOrientation}){
    currentOrientation.value = enumAppOrientation;
  }

}

bool xHorizontalOrientation(){
  OrientationController orientationController = Get.find();
  return orientationController.currentOrientation.value == EnumAppOrientation.horizontal;
}

EnumAppOrientation getCurrentOrientationEnum(){
  OrientationController orientationController = Get.find();
  return EnumAppOrientation.horizontal;
}


