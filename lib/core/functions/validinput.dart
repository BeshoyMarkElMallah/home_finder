import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid Username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone Number";
    }
  }

  if (type == "password") {
    if (!GetUtils.isLengthLessOrEqual(val, max)) {
      return "password must be less than $max characters";
    }

    if (!GetUtils.isLengthGreaterOrEqual(val, min)) {
      return "password must be at least $min characters";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be more than $max";
  }
}
