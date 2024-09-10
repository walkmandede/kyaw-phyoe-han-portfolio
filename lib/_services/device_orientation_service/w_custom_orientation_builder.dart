import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../_common/constants/app_functions.dart';
import 'c_orientation_controller.dart';

class MyOrientationBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, EnumAppOrientation orientation,Size windowSize,Size screenSize) builder;
  const MyOrientationBuilder(
      {super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (a1, c1) {
        Size windowSize = Size(c1.maxWidth,c1.maxHeight);
        Size screenSize = Size(c1.maxWidth,c1.maxHeight);
        try{
          screenSize = View.of(context).display.size;
          updateCurrentOrientation(windowSize: Size(c1.maxWidth,c1.maxHeight), screenSize: screenSize);
        }
        catch(e){
          saveLogFromException(e, "");
        }
        return GetBuilder<OrientationController>(
          builder: (orientationController) {
            return ValueListenableBuilder(
              valueListenable: orientationController.currentOrientation,
              builder: (context, orientation, child) {
                return builder(context, orientation,windowSize,screenSize);
              },
            );
          },
        );
      },
    );
  }

  void updateCurrentOrientation({required Size windowSize,required Size screenSize}){
    try{
      OrientationController orientationController = Get.find();
      if(windowSize.width >= windowSize.height){
        orientationController.currentOrientation.value = EnumAppOrientation.horizontal;
      }
      else{
        orientationController.currentOrientation.value = EnumAppOrientation.vertical;
      }
    }
    catch(e){
      superPrint(e);
      saveLogFromException(e, e);
    }
  }

}
