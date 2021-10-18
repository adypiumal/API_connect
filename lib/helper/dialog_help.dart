
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
// show error dioalog
  
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(Dialog(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? "",
            style: Get.textTheme.headline4,
          ),
          Text(
            description ?? "",
            style: Get.textTheme.headline6,
          ),
          ElevatedButton(
            onPressed: () {
            if (Get.isDialogOpen) Get.back();
            },
            child: Text('okey'),
          )
        ],
      ),
    )));
  }

  //show loading
  static void showLoading(String messege) {
    Get.dialog(Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text(messege ?? "Loading...."),
        ],
      ),
    )));
  }

  //hide loding
  static void hideLoading() {
  if (Get.isDialogOpen) Get.back();
  }
}
