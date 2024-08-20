import 'package:flutter/cupertino.dart';

class Validators {
  Validators._();

  static final Validators instance = Validators._();

  static String? validateMobileNumber(String? value,BuildContext context) {
    Pattern patternMobileNumber =
        r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    value = value?.trim();
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if (value.contains("+") &&
        value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
        !value.contains(RegExp(r'[a-zA-Z]')) &&
        !value.contains(RegExp(r'[ء-ي]'))) {
      return 'pleaseEnterValidNumber';
    } else if (!value.contains(RegExp(r'[a-zA-Z]')) &&
        value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
        !value.contains("+") &&
        !value.contains(RegExp(r'[ء-ي]'))) {
      if (checkPattern(pattern: patternMobileNumber, value: value)) {
        return 'pleaseEnterValidNumber';
      }
    }
    return null;
  }

  static String? validateName(String? value,BuildContext context) {
    String patternName =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$";
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if (value.toString().length < 2 &&
        !checkPattern(pattern: patternName, value: value)) {
      return 'nameMustBeAtLeast2Letters';
    } else if (value.toString().length > 30) {
      return 'nameMustBeAtMost30Letters';
    }
    else {
      return null;
    }
  }

  static String? fieldIsEmpty(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    }
    return null;
  }

  static String? validateLoginPassword(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length < 5){
      return 'passwordDigit';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value,BuildContext context) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password is weak';
      } else if(value.length < 8){
        return 'passwordDigit';
      }  else {
        return null;
      }
    }
  }

  static String? validateConfirmPassword(
      String? confirmPassValue, String? passValue, BuildContext context) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (confirmPassValue!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else {
      if (!regex.hasMatch(confirmPassValue)) {
        return 'Password is weak';
      } else if(confirmPassValue != passValue){
        return 'confirmPassNotMatch';
      }  else {
        return null;
      }
    }
  }

  static bool isNumeric(String str,BuildContext context) {
    Pattern patternInteger = r'^-?[0-9]+$';
    return checkPattern(pattern: patternInteger, value: str);
  }

  static bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validateNationalId(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length != 14){
      return 'pleaseEnterValidNationalID';
    }else {
      return null;
    }
  }

  static String? validateTaxNumber(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length != 9){
      return 'pleaseEnterValidTaxNumber';
    }else {
      return null;
    }
  }


  static String? validateCardNumber(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length != 16){
      return 'pleaseEnterValidCardNumber';
    }else {
      return null;
    }
  }

  static String? validateCardMonth(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length != 2){
      return 'pleaseEnterValidMonth';
    }else {
      return null;
    }
  }

  static String? validateCardYear(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'thisFieldIsEmpty';
    } else if(value.length != 2){
      return 'pleaseEnterValidYear';
    }else {
      return null;
    }
  }

  static String? validateVerificationCode(String? value,BuildContext context) {
    if (value!.isEmpty) {
      return 'pleaseEnterVerificationCode';
    } else if(value.length != 6){
      return 'pleaseEnterVerificationCode';
    }else {
      return null;
    }
  }

}
