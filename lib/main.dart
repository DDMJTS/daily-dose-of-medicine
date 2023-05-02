import 'package:flutter/material.dart';
import 'DetailView.dart';
import 'Setting.dart';

void main() {
  runApp(DDMApp());
}

class Journal {
  final String title;
  final String author;
  final String date;
  final String summary;

  Journal({required this.title, required this.author, required this.date, required this.summary});
}

class DDMApp extends StatelessWidget {
  final List<Journal> journals = [
    Journal(
      title: 'Journal Title 1',
      author: 'Author 1',
      date: 'January 1, 2023',
      summary: 'Summary of Journal 1',
    ),
    Journal(
      title: 'Journal Title 2',
      author: 'Author 2',
      date: 'February 15, 2023',
      summary: 'Summary of Journal 2',
    ),
    Journal(
      title: 'Journal Title 3',
      author: 'Author 3',
      date: 'March 10, 2023',
      summary: 'Summary of Journal 3',
    ),
    Journal(
      title: 'Journal Title 4',
      author: 'Author 4',
      date: 'April 5, 2023',
      summary: 'Summary of Journal 4',
    ),
    Journal(
      title: 'Journal Title 5',
      author: 'Author 5',
      date: 'April 10, 2023',
      summary: 'Summary of Journal 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Dose of Medicine',
      home: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: const Text('Daily Dose of Medicine'),
                elevation: 0.0,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,  
                        MaterialPageRoute(
                          builder: (context) => Setting(),
                        ),
                      );
                    }, 
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: journals.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(journals[index].title),
                    subtitle: Text(journals[index].author + ' - ' + journals[index].date),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailView(journal: journals[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            settings: settings,
          );
        },
      ),
    );
  }
}