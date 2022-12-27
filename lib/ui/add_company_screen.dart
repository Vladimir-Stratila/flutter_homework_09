import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/blocs/companies_list_bloc.dart';
import 'package:flutter_homework_09/blocs/companies_list_events.dart';
import 'package:flutter_homework_09/data/model/company.dart';
import 'package:flutter_homework_09/ui/custom_form_field.dart';

class AddCompanyScreen extends StatelessWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Company'),
      ),
      body: const AddCompanyForm(),
    );
  }
}

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key});

  @override
  AddCompanyFormState createState() {
    return AddCompanyFormState();
  }
}

class AddCompanyFormState extends State<AddCompanyForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String industry = '';
  String description = '';

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
                labelText: 'Company Name',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter company name';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  name = value!;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                labelText: 'Industry',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter industry which company in';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  industry = value!;
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomFormField(
                labelText: 'Company Description',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description of company';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  description = value!;
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
                              Company newCompany =
                                  Company(0, name, description, industry);
                              BlocProvider.of<CompaniesListBloc>(context)
                                  .add(AddCompanyEvent(newCompany));
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Company saved')),
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
}
