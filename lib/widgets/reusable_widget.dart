import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:pinput/pinput.dart';
import 'package:rti_new_apps/colors.dart';

sizedBoxHeight(double height) {
  return SizedBox(
    height: height,
  );
}

sizedBoxWidth(double width) {
  return SizedBox(
    width: width,
  );
}

showLoader(BuildContext context) {
  return Loader.show(context,
      overlayColor: Colors.transparent,
      progressIndicator: Platform.isIOS
          ? const CupertinoActivityIndicator(
              color: Colors.black,
              radius: 12,
            )
          : CircularProgressIndicator(
              color: MyColor.deepBlue,
            ),
      themeData: Theme.of(context).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.green)));
}

hideLoader() {
  return Loader.hide();
}

mySuccessSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.success,
      ),
    );
myErrorSnackBar(String title, String message) => SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
textBoxFocusBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: MyColor.green,
      width: 1,
    ),
  );
}

const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
const fillColor = Color.fromRGBO(243, 246, 249, 0);
const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
