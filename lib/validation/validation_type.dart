abstract class ValidationType {}

class LettersAndDash extends ValidationType {
  static const lettersAndDash = r'^[a-z A-Z а-я А-Я -]+$';
}

class LettersAndNumbers extends ValidationType {
  static const lettersAndNumbers = r'^[a-z A-Z а-я А-Я 0-9]+$';
}
