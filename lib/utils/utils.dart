
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qrfinal/res/Colors/colors.dart';

class Utils{

  static void fileFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message ,
            backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message ,
      backgroundColor: AppColor.yellowColor,
      gravity: ToastGravity.CENTER,
    );
  }

  static snackbar(String title,String message){
    Get.snackbar(title, message);
  }
}