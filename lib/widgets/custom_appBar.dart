import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class CustomAppbar extends StatelessWidget {
  CustomAppbar(this.title,
      {this.titleWidget, this.actions, this.goBack = false, this.color});
  final bool goBack;
  final String title;
  final Color color;
  final Widget titleWidget;
  final List<Widget> actions;

  trimmedTitle() {
    if (title.length > 24) {
      return title.substring(0, 24) + "...";
    } else
      return title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).backgroundColor,
      alignment: Alignment.center,
      height: 54,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                if (goBack)
                  GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (Navigator.of(context).canPop()) {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pushNamed("/home");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Mdi.arrowLeft,
                        ),
                      )),
                Expanded(
                    child: titleWidget ??
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            trimmedTitle(),
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                        ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions != null ? actions : [],
            ),
          )
        ],
      ),
    );
  }
}
