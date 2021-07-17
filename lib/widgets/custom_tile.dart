import 'package:driver_app/Helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final Color color;
  final Widget icon;
  final String title;
  final String data;
  CustomTile({this.color, this.data, this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(color: AppColors.borderColor),
          ),
          Text(
            data,
            style: TextStyle(color: AppColors.borderColor),
          ),
        ],
      ),
    );
  }
}
