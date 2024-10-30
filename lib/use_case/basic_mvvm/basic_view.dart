// text cont. datayı alsın serivse yoolasın sonuca göre sayfaya atsin

// 1) validasyon yapilacak => 3'ten büyük olmalı
// 2) validasyon basarili ise buton aktif olmalı
// 3) butona tıklandığıdaki text controller degeri alip servise yollasın
// 4) servisten gelen sonucu ekrana yazsın

import 'package:basic_mvmm/use_case/basic_mvvm/basic_view_model.dart';
import 'package:basic_mvmm/use_case/basic_mvvm/core/basic_cache.dart';
import 'package:basic_mvmm/use_case/basic_mvvm/view/basic_view_mixin.dart';
import 'package:flutter/material.dart';

part './view/basic_input_field.dart';

class BasicView extends StatefulWidget {
  const BasicView({super.key});

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> with BasicViewMixin {
  final BasicViewModel _viewModel = BasicViewModel(cache: BasicCache());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BasicInputField(
              userNameController: userNameController,
              onControllChanged: onControllChanged),
          _SaveButton(
            isValidForTextControllers: isValidForTextControllers,
            onPressed: () async {
              final response =
                  await _viewModel.controllToUserName(basicRequestModel);
              controllToResult(response);
            },
          ),
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    required this.isValidForTextControllers,
    required this.onPressed,
  });

  final ValueNotifier<bool> isValidForTextControllers;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isValidForTextControllers,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: value == false ? null : onPressed,
          child: const Text('Save'),
        );
      },
    );
  }
}
