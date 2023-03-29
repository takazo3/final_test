import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:final_test_schedule/views/calendar.dart';
import 'package:final_test_schedule/src/drift/data.dart';
import 'package:intl/date_symbol_data_local.dart' as prefix;

void main() {
  final database = MyDatabase();
  prefix.initializeDateFormatting().then((_) => runApp(
        ProviderScope(
          child: MyApp(database: database),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.database});

  final MyDatabase database;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Calendar(
            // database: database,
            ));
  }
}
