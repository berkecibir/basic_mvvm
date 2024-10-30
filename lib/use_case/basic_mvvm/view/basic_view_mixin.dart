import 'package:basic_mvmm/use_case/basic_mvvm/basic_model.dart';
import 'package:basic_mvmm/use_case/basic_mvvm/basic_view.dart';
import 'package:basic_mvmm/use_case/basic_mvvm/view/home_example.dart';
import 'package:flutter/material.dart';

mixin BasicViewMixin on State<BasicView> {
  final TextEditingController _userNameController = TextEditingController();

  final ValueNotifier<bool> isValidForTextControllers =
      ValueNotifier<bool>(false);

  void onControllChanged(String value) {
    // 1) validasyon yapilacak => 3'ten büyük olmalı istersek
    isValidForTextControllers.value = value.length > 3;
  }

  TextEditingController get userNameController => _userNameController;

  String get valueByUserNameController => _userNameController.value.text;

  BasicModel get basicRequestModel =>
      BasicModel(userName: valueByUserNameController);

  Future<void> controllToResult(bool result) async {
    if (result) {
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeExample()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }
}
