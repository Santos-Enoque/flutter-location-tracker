import 'package:cadevo/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeviceActionButton extends StatelessWidget {
  final String image;
  final String text;
  final Function onTap;

  const DeviceActionButton({Key key,@required this.image,@required this.text,@required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
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
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Image.asset(image, width: 30,),
            Padding(
              padding: const EdgeInsets.all(4),
              child: CustomText(text: text, size: 18,),
            )
          ],
        ),
      ),
    );
  }
}
