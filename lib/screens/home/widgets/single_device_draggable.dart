import 'package:cadevo/constants/asset_path.dart';
import 'package:cadevo/providers/app.dart';
import 'package:cadevo/screens/home/widgets/device_action_button.dart';
import 'package:cadevo/screens/home/widgets/devices_draggable.dart';
import 'package:cadevo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SingleDeviceDraggable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return DraggableScrollableSheet(
        initialChildSize: .3,
        builder: (context, scrollable) {
      return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: CustomText(
                  text: appProvider.activeDevie.name,
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    appProvider.changeActiveDraggableWidget(DevicesDraggable());
                  })
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomText(
                text: "Last log 2 days ago",
                color: Colors.grey,
              ),
            ),
          SizedBox(height: 10,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              DeviceActionButton(image: playIcon, text: "Play Sound", onTap: (){}),
              DeviceActionButton(image: routeIcon, text: "Directions", onTap: (){}),
                Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            blurRadius: 3,
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: (){}))
              ],
            ),
          ),


            
          ],
        ),
      );
    });
  }
}
