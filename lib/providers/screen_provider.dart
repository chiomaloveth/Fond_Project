import 'package:flutter/material.dart';

class ScreenProvider with ChangeNotifier {
  bool _showBankDetails = false;
  bool _showSuccessScreen = false;
   bool isChecked = false;

  bool get showBankDetails => _showBankDetails;
  bool get showSuccessScreen => _showSuccessScreen;

  void toggleBankDetails() {
    _showBankDetails = !_showBankDetails;
    notifyListeners();
  }

  void toggleSuccessScreen() {
    _showSuccessScreen = !_showSuccessScreen;
    notifyListeners();
  }

  void reset() {
    _showBankDetails = false;
    _showSuccessScreen = false;
    notifyListeners();
  }
  void toggleCheckbox(bool value) {
    isChecked = value;
    notifyListeners(); // Notifies the UI to rebuild
  }
}