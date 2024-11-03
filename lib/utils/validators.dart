class Validators {
  static final _emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,7})$');
  static const validatorRequiredField = "* Wymagane pole";
  static const validatorSymbolInTheMail = "Uwzględnij znak \"@\" w adresie e-mail";
  static const validatorAfterSymbol = "Dodaj część po znaku \"@\"";
  static const validatorPassword = "Hasło musi zawierać minimum 8 znaków i składać się z conajmniej 1 wielkiej litery oraz 1 cyfry";
  static const validatorFullname = "Nieprawidłowe imię i nazwisko";
  static const validatorFirstName = "Nieprawidłowe imię";
  static const validatorLastName = "Nieprawidłowe nazwisko";

  static String? validateEmail(String? emailValue) {
    if (emailValue == null) return validatorRequiredField;

    if (!emailValue.contains("@")) {
      return validatorSymbolInTheMail; 
    } else {
      if (!_emailRegExp.hasMatch(emailValue)) {
        return validatorAfterSymbol; 
      }
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) return validatorRequiredField;

    RegExp lowerCaseRegex = RegExp(r'[a-z]');
    RegExp upperCaseRegex = RegExp(r'[A-Z]');
    RegExp numberRegex = RegExp(r'[0-9]');

    if (lowerCaseRegex.hasMatch(password) && upperCaseRegex.hasMatch(password) && numberRegex.hasMatch(password) && password.length >= 8) {
      return null; // Valid password
    } else {
      return validatorPassword; // Error for invalid password
    }
  }

  static String? validateFirstName(String? firstName) {
    if (firstName == null) return validatorFirstName;

    RegExp firstNameRegex = RegExp(r"^[A-ZĄĆĘŁŃÓŚŹŻ][a-ząćęłńóśźż]+(-[A-ZĄĆĘŁŃÓŚŹŻ][a-ząćęłńóśźż]+)?$");

    if (firstNameRegex.hasMatch(firstName)) {
      return null; // Valid first name
    } else {
      return validatorFirstName; // Error for invalid first name
    }
  }

  static String? validateLastName(String? lastName) {
    if (lastName == null) return validatorLastName;

    RegExp lastNameRegex = RegExp(r"^[A-ZĄĆĘŁŃÓŚŹŻ][a-ząćęłńóśźż]+(-[A-ZĄĆĘŁŃÓŚŹŻ][a-ząćęłńóśźż]+)?$");

    if (lastNameRegex.hasMatch(lastName)) {
      return null; // Valid last name
    } else {
      return validatorLastName; // Error for invalid last name
    }
  }

  static String? validateFullname(String? fullName) {
    if (fullName == null) return validatorRequiredField;

    RegExp fullnameRegex = RegExp(r"^\s*([A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]{1,}([\.,] |[-']| ))+[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]+\.?\s*$");

    if (fullnameRegex.hasMatch(fullName)) {
      return null; // Valid full name
    } else {
      return validatorFullname; // Error for invalid full name
    }
  }

  static String? validateNull(String? value) {
    String errorMessage = validatorRequiredField;

    if (value == null || value.isEmpty) {
      return errorMessage; // Error for null or empty value
    }
    return null; // Valid value
  }
}
