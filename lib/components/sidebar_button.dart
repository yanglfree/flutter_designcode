import 'package:flutter/material.dart';

import '../constants.dart';

class SidebarButton extends StatelessWidget {
  const SidebarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("button clicked");
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                blurRadius: 16.0,
                offset: Offset(0, 10),
              )
            ]),
        child: Image.asset(
          'asset/icons/icon-sidebar.png',
          color: kPrimaryLabelColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
      ),
    );
  }
}
