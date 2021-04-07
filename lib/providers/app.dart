import 'package:cadevo/models/device.dart';
import 'package:cadevo/screens/home/widgets/devices_draggable.dart';
import 'package:cadevo/utils/enums/auth.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  AuthenticationScreenToDisplay screenToDisplay;
  Widget activeDraggableWidget = DevicesDraggable();
  DeviceModel activeDevie;

  AppProvider.init(){
    screenToDisplay = AuthenticationScreenToDisplay.Login;
  }

  changeAuthDisplayedScreen(AuthenticationScreenToDisplay screen){
    screenToDisplay = screen;
    notifyListeners();
  }

  changeActiveDraggableWidget(Widget widget){
    activeDraggableWidget = widget;
    notifyListeners();
  }

  changeActiveDevice(DeviceModel device){
      activeDevie = device;
      notifyListeners();
  }
}
