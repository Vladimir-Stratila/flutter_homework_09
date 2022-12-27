import 'package:flutter/material.dart';
import 'package:flutter_homework_09/helpers/screen_navigation.dart';
import 'package:flutter_homework_09/ui/add_job_screen.dart';
import 'package:flutter_homework_09/ui/jobs_list.dart';


class JobsListScreen extends StatelessWidget {
  const JobsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jobs List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeScreen(context, const AddJobScreen());
        },
        child: const Icon(Icons.add),
      ),
      body: const JobsList(),
    );
  }
}