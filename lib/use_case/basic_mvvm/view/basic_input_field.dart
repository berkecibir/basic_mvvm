part of '../basic_view.dart';

class BasicInputField extends StatelessWidget {
  const BasicInputField(
      {super.key,
      required this.userNameController,
      required this.onControllChanged});

  final TextEditingController userNameController;

  final ValueChanged<String> onControllChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: userNameController,
      onChanged: onControllChanged,
      decoration: InputDecoration(
        hintText: 'Enter a user name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
