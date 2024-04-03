import 'package:calendar_flutter_awesome/animation.dart';
import 'package:calendar_flutter_awesome/calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home: const MyHomePage(title: 'Flutter Calendar'),
      // home: const MyHomePage1(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Calendar(),
      // body: const Center(
      //   child: WeeklyCalendar(
      //     calendarStyle: CalendarStyle(
      //       locale: "en",
      //       padding: EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.all(Radius.circular(14)),
      //       ),
      //       headerDateTextAlign: Alignment.centerLeft,
      //       headerDateTextColor: Colors.white,
      //       footerDateTextColor: Colors.grey,
      //       isShowFooterDateText: true,
      //     ),
      //   ),
      // ),
    );
  }
}
