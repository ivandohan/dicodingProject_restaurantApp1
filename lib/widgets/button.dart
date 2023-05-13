import 'package:flutter/widgets.dart';

class ButtonReusable extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double height;
  final double itemSize;

  const ButtonReusable({
    super.key,
    required this.backgroundColor,
    required this.height,
    required this.itemSize,
    required this.width,
    required this.borderColor,
  });

  const factory ButtonReusable.withText({
    required Color backgroundColor,
    required Color borderColor,
    required double width,
    required double height,
    required double itemSize,
    required String text,
    required Color itemColor,
  }) = _ButtonWithText;

  const factory ButtonReusable.withIcon({
    required Color backgroundColor,
    required Color borderColor,
    required double width,
    required double height,
    required double itemSize,
    required IconData icon,
    required Color itemColor,
  }) = _ButtonWithIcon;

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
    );
  }
}

class _ButtonWithText extends ButtonReusable {
  final String text;
  final Color itemColor;

  const _ButtonWithText({
    required super.backgroundColor,
    required super.borderColor,
    required super.width,
    required super.height,
    required super.itemSize,
    required this.text,
    required this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context),
        Text(
          text,
          style: TextStyle(color: itemColor),
        ),
      ],
    );
  }
}

class _ButtonWithIcon extends ButtonReusable {
  final IconData icon;
  final Color itemColor;

  const _ButtonWithIcon({
    required super.backgroundColor,
    required super.borderColor,
    required super.width,
    required super.height,
    required super.itemSize,
    required this.icon,
    required this.itemColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context),
        Icon(
          icon,
          color: itemColor,
        ),
      ],
    );
  }
}
