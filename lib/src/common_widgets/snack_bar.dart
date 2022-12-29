import 'package:flutter/material.dart';

const defaultSnackBarDuration = Duration(seconds: 3);
const defaultSnackBarBehavior = SnackBarBehavior.floating;

SnackBar primarySnackBar({required String message}) {
  return SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    behavior: defaultSnackBarBehavior,
    duration: defaultSnackBarDuration,
    margin: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
