import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_homework_09/ui/favorite_jobs_screen.dart';
import 'blocs/company_jobs_list_bloc.dart';
import 'blocs/jobs_list_bloc.dart';
import 'blocs/companies_list_bloc.dart';
import 'di/di.dart';
import 'ui/jobs_list_screen.dart';
import 'ui/companies_list_screen.dart';
import 'package:injector/injector.dart' show Injector;

Future<Widget> main() async {
  await Di().setup();
  Widget widget = const MyApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => Injector.appInstance.get<JobsListBloc>()),
        BlocProvider(
          create: (context) => Injector.appInstance.get<CompaniesListBloc>()),
        BlocProvider(
          create: (context) => Injector.appInstance.get<CompanyJobsListBloc>()),
      ],
      child: widget
    )
  );
  return widget;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Homework 9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const _screensList = [
    JobsListScreen(),
    CompaniesListScreen(),
    FavoriteJobsScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return const JobsListScreen();
    //return const CompaniesListScreen();
    return Scaffold(
      body: _screensList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Jobs'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.domain),
              label: 'Companies'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
