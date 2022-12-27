import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/helpers/screen_navigation.dart';
import 'package:flutter_homework_09/blocs/jobs_list_bloc.dart';
import 'package:flutter_homework_09/blocs/jobs_list_events.dart';
import 'package:flutter_homework_09/blocs/jobs_list_states.dart';
import 'package:flutter_homework_09/data/data.dart';
import 'package:flutter_homework_09/ui/job_details_screen.dart';


class JobsList extends StatefulWidget {
  const JobsList({super.key});

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  var jobs = <Job>[];
  var companies = <Company>[];

  @override
  void didChangeDependencies() {
    updateJobsList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsListBloc, JobsListState>(
      listener: (context, state) {
        if (state is JobsListLoadedState) {
          jobs = state.jobs;
          companies = state.companies;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
                width: double.infinity,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${jobs.length} jobs found',
                    style: const TextStyle(fontSize: 18),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    changeScreen(context, JobDetailsScreen(
                        jobs[index],
                        companies.firstWhere((e) => e.id == jobs[index].companyId).name
                      )
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jobs[index].title,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            companies.firstWhere((e) => e.id == jobs[index].companyId).name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            jobs[index].city,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void updateJobsList() {
    BlocProvider.of<JobsListBloc>(context).add(UpdateJobsListEvent());
  }
}