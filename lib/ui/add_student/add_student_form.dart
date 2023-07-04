import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist/data/repository/add_student_repository.dart';
import 'package:studentlist/ui/add_student/add_student_cubit.dart';

import '../../data/data.dart';

class AddStudentForm extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  final cubit = AddStudentCubit(addStudentRepository);

  AddStudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddStudentCubit>(
      create: (context) => cubit,
      child:
        Builder(
          builder: (context) {
            final state=context.watch<AddStudentCubit>().state;
            if(state is AddStudentSuccess){
              Navigator.of(context).pop();
            }
            return Scaffold(
                appBar: AppBar(
                  title:  Text('Add Student Form'),
                ),
                floatingActionButton: FloatingActionButton.extended(
                    onPressed: () async {
                      if(_firstNameController.text.isNotEmpty && _lastNameController.text.isNotEmpty && _courseController.text.isNotEmpty && _scoreController.text.isNotEmpty){
                        context.read<AddStudentCubit>().onSaveButtonClicked(_firstNameController.text, _lastNameController.text, _courseController.text, int.parse(_scoreController.text));
                      }
                    },
                    label: Row(
                      children: const [Icon(Icons.check), Text('Save')],
                    )),
                floatingActionButtonLocation: FloatingActionButtonLocation
                    .centerFloat,
                body:(state is! AddStudentLoading) ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          label: Text('First Name'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          label: Text('Last Name'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: _courseController,
                        decoration: const InputDecoration(
                          label: Text('Course'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _scoreController,
                        decoration: const InputDecoration(
                          label: Text('Score'),
                        ),
                      ),
                    ],
                  ),
                ) : const Center(child: CircularProgressIndicator(),),
              );
          }
        )
      //   },
      // ),
    );
  }
}