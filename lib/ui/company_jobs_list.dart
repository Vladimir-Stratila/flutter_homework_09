import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/blocs/company_jobs_list_bloc.dart';
import 'package:flutter_homework_09/blocs/company_jobs_list_events.dart';
import 'package:flutter_homework_09/blocs/company_jobs_list_states.dart';
import 'package:flutter_homework_09/helpers/screen_navigation.dart';
import 'package:flutter_homework_09/data/data.dart';
import 'package:flutter_homework_09/ui/job_details_screen.dart';


class CompanyJobsList extends StatefulWidget {
  final int companyId;
  final String companyName;

  const CompanyJobsList(this.companyId, this.companyName, {super.key});

  @override
  State<CompanyJobsList> createState() => _CompanyJobsListState();
}

class _CompanyJobsListState extends State<CompanyJobsList> {
  var jobs = <Job>[];

  @override
  void didChangeDependencies() {
    updateCompanyJobsList(widget.companyId);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyJobsListBloc, CompanyJobsListState>(
      listener: (context, state) {
        if (state is CompanyJobsListLoadedState) {
          jobs = state.jobs;
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
                    changeScreen(context,
                        JobDetailsScreen(jobs[index], widget.companyName));
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

  void updateCompanyJobsList(int companyId) {
    BlocProvider.of<CompanyJobsListBloc>(context)
        .add(UpdateCompanyJobsListEvent(widget.companyId));
  }
}
