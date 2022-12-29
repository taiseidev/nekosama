import 'package:flutter/material.dart';

abstract class UserRepository {
  Future<void> signIn(String value, VoidCallback callback);
  Future<void> signOut();
}
