import 'package:flutter/material.dart';
import 'package:flutter_homework_09/data/model/job.dart';


class JobDetailsScreen extends StatelessWidget {
  final Job job;
  final String company;

  const JobDetailsScreen(
    this.job,
    this.company,
    {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.favorite),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.domain,
                          color: Colors.grey
                        ),
                        const SizedBox(width: 16),
                        Text(
                          company,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                            Icons.location_pin,
                            color: Colors.grey
                        ),
                        const SizedBox(width: 16),
                        Text(
                          job.city,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Job description',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        )
                    ),
                    const SizedBox(height: 16),
                    Text(
                      job.description,
                      style: const TextStyle(
                        fontSize: 18,
                      )
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
