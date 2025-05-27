bool isValidPhoneNumber(String phoneNumber) {
  // Add your phone number validation logic here
  return RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(phoneNumber);
}
