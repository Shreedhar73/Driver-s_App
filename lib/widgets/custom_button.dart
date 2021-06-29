import 'package:driver_app/Helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final IconData prefix;
  final bool loading;
  final double width;
  final IconData suffixIcon;
  final Color color;
  final Color textColor;
  final bool borderRadius;
  final Border border;

  const CustomButton(
      {Key key,
      this.onPress,
      this.suffixIcon,
      this.prefix,
      this.label,
      this.loading = false,
      this.width,
      this.color,
      this.textColor,
      this.border,
      this.borderRadius = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onPress,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            margin: EdgeInsets.only(
                top: constraints.biggest.height * 0.3 > 16
                    ? 16
                    : constraints.biggest.height * 0.3),
            padding: EdgeInsets.all(constraints.biggest.height * 0.2 > 12
                ? 12
                : constraints.biggest.height * 0.2),
            width: this.width ?? double.maxFinite,
            constraints: BoxConstraints(maxHeight: 44),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).primaryColor,
              border: this.border ?? null,
              borderRadius:
                  borderRadius ? BorderRadius.circular(6) : BorderRadius.zero,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (loading)
                  return SizedBox(
                    height: constraints.biggest.height > 16
                        ? 16
                        : constraints.biggest.height,
                    width: constraints.biggest.height > 16
                        ? 16
                        : constraints.biggest.height,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation(
                          this.color == AppColors.backgroundColor
                              ? AppColors.primaryColor
                              : AppColors.backgroundColor),
                    ),
                  );
                else
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (prefix != null) ...[
                          Icon(prefix,
                              color: Theme.of(context).backgroundColor),
                          SizedBox(width: 20)
                        ],
                        Text(
                          label,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .subtitle2
                              .copyWith(
                                color: this.textColor ??
                                    Theme.of(context).backgroundColor,
                                fontSize: constraints.biggest.height > 15
                                    ? 15
                                    : constraints.biggest.height,
                              ),
                        ),
                        if (suffixIcon != null)
                          Icon(suffixIcon,
                              color: Theme.of(context).backgroundColor),
                      ]);
              },
            ),
          );
        },
      ),
    );
  }
}
