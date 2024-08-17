import 'package:flutter/material.dart';
import 'package:local_database_setup/app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await openDatabase(
    join(await getDatabasesPath(), 'data_entry.db'),
    onCreate: (Database db, int v) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS inputs(one TEXT, two TEXT, dateTime Text)',
      );
    },
    version: 1,
  );
  runApp(const MyApp());
}