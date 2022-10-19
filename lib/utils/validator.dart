class Validator {
  static String? isNameValid(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter a name';
    }
    return null;
  }

  static String? isEmailValid(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? isPwdValid(String? value) {
    if (value!.trim().isEmpty) {
      return 'Please enter a valid password';
    } else if (value.trim().length < 6) {
      return 'PLease enter more than 6 character';
    }
    return null;
  }
}
