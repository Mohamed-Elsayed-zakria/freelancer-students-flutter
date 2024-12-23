import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

abstract class ShowToast {
  static void show({required String msg}) {
    toastification.show(
      title: Text(msg),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      showProgressBar: false,
      showIcon: false,
    );
  }
}
