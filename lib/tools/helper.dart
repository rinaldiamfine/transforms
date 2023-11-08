import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';
import 'package:intl/intl.dart';

vspace(double? size) {
  return SizedBox(
    height: size,
  );
}

hspace(double? size) {
  return SizedBox(
    width: size,
  );
}

DateFormat dateFormatWithTimeZone() {
  // 2023-08-18T08:20:29.650747+07:00
  return DateFormat("yyyy-MM-ddTHH:mm:ss");
}


class CustomLoadingCircular {
  late BuildContext context;
  CustomLoadingCircular(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(
                color: CustomColor.primary,
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }
}