import 'package:StateManagementMVCS/models/view_model/register_form_model.dart';
import 'package:flutter/foundation.dart';

class RegisterModel extends ChangeNotifier {
  // Register sayfasıdna kullanılan model.
  // Sonuç sayfasına geçişte ve sonrasında ihtiyaç var.
  RegisterFormModel _formModel;
  RegisterFormModel get formModel => _formModel;
  set formModel(RegisterFormModel model) {
    _formModel = model;
    notifyListeners();
  }
}
