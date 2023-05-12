import 'package:flutter/widgets.dart';

class ButtonReusable extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final double itemSize;
  String? text;
  IconData? icon;
  Color? itemColor;

  ButtonReusable(
      {Key? key,
      required this.backgroundColor,
      required this.height,
      required this.itemSize,
      required this.width,
      required this.borderColor})
      : super(key: key);

  ButtonReusable.icon(
      {Key? key,
      this.icon,
      required this.backgroundColor,
      required this.height,
      required this.width,
      required this.itemSize,
      required this.borderColor})
      : super(key: key);

  ButtonReusable.text({
    Key? key,
    required this.text,
    this.itemColor,
    required this.height,
    required this.width,
    required this.itemSize,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: icon == null
          ? Center(
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: itemSize,
                  color: itemColor,
                ),
              ),
            )
          : Center(
              child: Icon(
              icon,
              color: itemColor,
              size: itemSize,
            )),
    );
  }
}
