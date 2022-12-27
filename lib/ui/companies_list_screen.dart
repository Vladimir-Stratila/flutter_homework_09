import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/helpers/screen_navigation.dart';
import 'package:flutter_homework_09/blocs/companies_list_bloc.dart';
import 'package:flutter_homework_09/blocs/companies_list_events.dart';
import 'package:flutter_homework_09/blocs/companies_list_states.dart';
import 'package:flutter_homework_09/data/data.dart';
import 'package:flutter_homework_09/ui/add_company_screen.dart';
import 'package:flutter_homework_09/ui/company_details_screen.dart';


class CompaniesListScreen extends StatefulWidget {
  const CompaniesListScreen({super.key});

  @override
  State<CompaniesListScreen> createState() => _CompaniesListScreenState();
}

class _CompaniesListScreenState extends State<CompaniesListScreen> {
  var companies = <Company>[];

  @override
  void didChangeDependencies() {
    updateCompaniesList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompaniesListBloc, CompaniesListState>(
      listener: (context, state) {
        if (state is CompaniesListLoadedState) {
          companies = state.companies;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Companies List')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              changeScreen(context, AddCompanyScreen());
            },
            child: Icon(Icons.add),
          ),
          body: Column(
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${companies.length} companies found',
                      style: const TextStyle(fontSize: 18),
                    ),
                  )),
              Expanded(
                child: ListView.builder(
                  itemCount: companies.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      changeScreen(
                          context, CompanyDetailsScreen(companies[index]));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              companies[index].name,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              companies[index].industry,
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
          ),
        );
      },
    );
  }

  void updateCompaniesList() {
    BlocProvider.of<CompaniesListBloc>(context).add(UpdateCompaniesListEvent());
  }
}
