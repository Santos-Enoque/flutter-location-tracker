import 'package:cadevo/models/device.dart';
import 'package:flutter/material.dart';

import 'device_widget.dart';

class DevicesDraggable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        DraggableScrollableSheet(
            initialChildSize: .3,
            builder: (context, scrollable){
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.8),
                          offset: Offset(3, 2),
                          blurRadius: 7)
                    ]),
                child: ListView(
                  controller: scrollable,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          height: 6,
                          width: 40,
                          decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)
                          ),
                        ),
                      ],
                    ),
                    DeviceWidget(device: DeviceModel(
                      name: "Samsung S20",
                      os: 'android'
                    ),),

                      DeviceWidget(device: DeviceModel(
                      name: "iPhone 12",
                      os: 'ios'
                    ),),
                  ],
                ),
              ),
            ],
          );
        });
  }
}