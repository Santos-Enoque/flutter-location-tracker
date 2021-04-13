import 'package:cadevo/models/device.dart';
import 'package:cadevo/screens/home/widgets/devices_draggable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  static AppController instance = Get.find();
  Rx<Widget> activeDraggableWidget = Rx<Widget>(DevicesDraggable());
  Rx<DeviceModel> activeDevie = DeviceModel().obs;
  RxBool isLoginWidgetDisplayed = true.obs;


  changeDIsplayedAuthWidget(){
    isLoginWidgetDisplayed.value = !isLoginWidgetDisplayed.value;
  }

  changeActiveDeviceTo(DeviceModel device){
    activeDevie.value = device;
  }

  changeActiveDraggableWidgetTo(Widget widget){
    activeDraggableWidget.value = widget;
  }
}