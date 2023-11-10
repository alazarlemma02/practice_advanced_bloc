class Validator {
  String? password;
  static String? validateName({required String fullName}) {
    if (fullName.isEmpty) {
      return "Name cannot be empty";
    }

    return null;
  }

  static String? validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return "Insert your email";
    } else if (!emailRegExp.hasMatch(email)) {
      return "Invalid email format";
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return "Insert a Password";
    } else if (password.length < 6) {
      return "short password length";
    }
    return null;
  }

  static String? validatePhoneNumber({required String phoneNumber}) {
    if (phoneNumber.isEmpty) {
      return "Insert a Phone number";
    }
    return null;
  }

  static String? validateProfileField({required String fieldData}) {
    if (fieldData.isEmpty) {
      return "Insert Profile picture";
    }
  }

  static String? validateConfirmPassword(
      {required String confirmPassword, required String password}) {
    if (confirmPassword.isEmpty) {
      return "Confirm your password";
    } else if (confirmPassword != password) {
      return "Password does not match";
    }
    return null;
  }
}
