import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlist/data/data.dart';
import 'package:studentlist/data/repository/home_repository.dart';
import 'package:studentlist/ui/home/home_bloc.dart';

import '../add_student/add_student_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBloc(homeRepository);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        bloc.stream.forEach((state) {
          if (state is HomeLoading) {
          } else if (state is HomeSuccess) {
          } else if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              state.errorMessage,
              textDirection: TextDirection.rtl,
            )));
          }
        });
        bloc.add(HomeStarted());
        return bloc;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        // buildWhen: (previous,current){
        //   return current is HomeLoading || current is HomeSuccess ;
        // },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Students List Flutter'),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () async {
                    final result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AddStudentForm()));
                    setState(() {});
                  },
                  label: Row(
                    children: const [Icon(Icons.add), Text('Add Student')],
                  )),
              body: (state is HomeSuccess)
                  ? ListView.builder(
                      padding: const EdgeInsets.only(bottom: 84),
                      itemCount: state.students.length,
                      itemBuilder: (context, index) {
                        return _Student(
                          studentData: state.students[index],
                        );
                      })
                  : (state is HomeLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Center(
                          child: Text("Error Happened"),
                        )

              // }

              );
        },
      ),
    );
  }
}

class _Student extends StatelessWidget {
  final StudentData studentData;

  const _Student({Key? key, required this.studentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(0.05))
          ]),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
            child: Text(
              studentData.firstName.characters.first,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  fontSize: 24),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${studentData.firstName} ${studentData.lastName}'),
                const SizedBox(
                  height: 8,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.grey.shade200),
                    child: Text(
                      studentData.course,
                      style: const TextStyle(fontSize: 10),
                    ))
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bar_chart_rounded,
                color: Colors.grey.shade400,
              ),
              Text(
                studentData.score.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
