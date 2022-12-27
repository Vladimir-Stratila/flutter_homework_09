import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/blocs/companies_list_bloc.dart';
import 'package:flutter_homework_09/blocs/companies_list_events.dart';
import 'package:flutter_homework_09/blocs/companies_list_states.dart';
import 'package:flutter_homework_09/blocs/jobs_list_bloc.dart';
import 'package:flutter_homework_09/blocs/jobs_list_events.dart';
import 'package:flutter_homework_09/data/model/company.dart';
import 'package:flutter_homework_09/data/model/job.dart';
import 'package:flutter_homework_09/ui/custom_form_field.dart';


class AddJobScreen extends StatelessWidget {
  const AddJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Job'),
      ),
      body: const AddJobForm(),
    );
  }
}

class AddJobForm extends StatefulWidget {
  const AddJobForm({super.key});

  @override
  AddJobFormState createState() {
    return AddJobFormState();
  }
}

class AddJobFormState extends State<AddJobForm> {
  final _formKey = GlobalKey<FormState>();
  var companies = <Company>[];

  int companyId = 0;
  String title = '';
  String description = '';
  String city = '';
  int? currentValue;

  @override
  void didChangeDependencies() {
    updateCompaniesList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomFormField(
                labelText: 'Job Title',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job title';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  title = value!;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                labelText: 'Description',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job description';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  description = value!;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              BlocConsumer<CompaniesListBloc, CompaniesListState>(
                  listener: (context, state) {
                if (state is CompaniesListLoadedState) {
                  companies = state.companies;
                }
              }, builder: (context, state) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                        hint: const Text('Company'),
                        value: currentValue,
                        iconSize: 36,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        items: companies.map((Company company) {
                          return DropdownMenuItem<int>(
                              value: company.id,
                              child: Text(
                                company.name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            currentValue = newValue;
                            companyId = currentValue!;
                          });
                        }),
                  ),
                );
              }),
              const SizedBox(height: 16),
              CustomFormField(
                labelText: 'City',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city where job is';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  city = value!;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Job newJob =
                                  Job(0, title, companyId, description, city);
                              BlocProvider.of<JobsListBloc>(context)
                                  .add(AddJobEvent(newJob));
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Job saved')),
                              );
                            }
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateCompaniesList() {
    BlocProvider.of<CompaniesListBloc>(context).add(UpdateCompaniesListEvent());
  }
}
