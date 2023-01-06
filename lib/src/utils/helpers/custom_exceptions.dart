//these classes implements exception with means they can be thrown
//anywhere error occurs in the program

class NoInternetException implements Exception {
  String message;
  NoInternetException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoInternetSocketException implements Exception {
  String message;
  NoInternetSocketException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoServiceFoundException implements Exception {
  String message;
  NoServiceFoundException(this.message);

  @override
  String toString() {
    return message;
  }
}

class InvalidFormatException implements Exception {
  String message;
  InvalidFormatException(this.message);

  @override
  String toString() {
    return message;
  }
}

class UnknownException implements Exception {
  String message;
  UnknownException(this.message);

  @override
  String toString() {
    return message;
  }
}
