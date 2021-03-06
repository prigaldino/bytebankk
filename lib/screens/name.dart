import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String>{
  NameCubit(String name ) : super(name);

  void change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;



    final textTheme = Theme.of(context).textTheme;
   return Scaffold(
      appBar: AppBar(title: const Text('Change name')),
      body: Column(children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Desired name:'),
          style: TextStyle(fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child:ElevatedButton(
            child: Text('Change'),
            onPressed: () {
              final name = _nameController.text;
              context.read<NameCubit>().change(name);
              Navigator.pop(context);
            },
          )
        ),
      ]),
    );
  }
}