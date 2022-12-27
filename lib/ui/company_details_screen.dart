import 'package:flutter/material.dart';
import 'package:flutter_homework_09/ui/company_jobs_list.dart';
import 'package:flutter_homework_09/data/model/company.dart';


class CompanyDetailsScreen extends StatelessWidget {
  final Company company;

  const CompanyDetailsScreen(
    this.company,
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add to favorite',
        child: Icon(Icons.favorite),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 150,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(height: 16),
                        Text(
                          company.industry,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Company description',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        const SizedBox(height: 16),
                        Text(
                          company.description,
                          style: const TextStyle(
                            fontSize: 18,
                          )
                        ),
                        const SizedBox(height: 32),
                        const Text(
                            'Jobs available:',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(child: CompanyJobsList(company.id, company.name)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
