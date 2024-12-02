import 'package:agora/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameForm extends StatefulWidget {
  const NameForm({
    super.key,
  });

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController.text = context.read<UserCubit>().state.name;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _nameController,
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Nombre',
        suffixIcon: IconButton(
          onPressed: () {
            _nameController.clear();
            context.read<UserCubit>().updateName('Anónimo');
          },
          icon: const Icon(Icons.close_outlined),
        ),
      ),
      onChanged: (value) {
        context.read<UserCubit>().updateName(value);
      },
      onTapOutside: (onTapOutside) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
