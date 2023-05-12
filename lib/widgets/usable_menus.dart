import 'package:flutter/material.dart';

class UsableMenus extends StatelessWidget {
  final String menus;
  bool? isSelected;

  UsableMenus({Key? key, required this.menus}) : super(key: key);
  UsableMenus.selection(
      {Key? key, required this.menus, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      padding: const EdgeInsets.all(10),
      height: 40,
      decoration: BoxDecoration(
          color: (isSelected != null && isSelected!)
              ? Colors.black45
              : Colors.grey.withOpacity(0.2),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Row(
        children: [Text(menus)],
      ),
    );
  }
}
