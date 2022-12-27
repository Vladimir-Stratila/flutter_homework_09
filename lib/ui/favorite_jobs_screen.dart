import 'package:flutter/material.dart';


class FavoriteJobsScreen extends StatelessWidget {
  const FavoriteJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Jobs')),
      body: const Center(
        child: Text('You have no favorites yet'),
      ),
    );
  }
}