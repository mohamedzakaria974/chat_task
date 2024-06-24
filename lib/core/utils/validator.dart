import 'package:chat_task/core/constants/failure_messages.dart';

abstract class Validator {
  static String? requiredFieldValidator(String? text) {
    return text != null && text.trim().isNotEmpty ? null : kRequiredField;
  }

  static bool isEmailValid(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(email);
  }

  static String? validateEmail(String? userEmail) {
    return (userEmail?.isEmpty ?? true)
        ? kRequiredField
        : isEmailValid(userEmail!)
            ? null
            : kInvalidEmail;
  }
}
