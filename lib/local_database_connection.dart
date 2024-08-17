import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_entity.dart';

class LocalDatabaseConnection {
  static Future<void> insert(DataEntity data) async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'data_entry.db'),
    );
    final db = await database;
    await db.insert('inputs', data.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<DataEntity>> fetch() async {
    List<DataEntity> dataList = [];
    final database = openDatabase(
      join(await getDatabasesPath(), 'data_entry.db'),
    );
    final db = await database;
    final List<Map> fetchDataList = await db.query('inputs');
    for (final {
          'one': one as String,
          'two': two as String,
          'dateTime': dateTime as String,
        } in fetchDataList) {
      dataList.insert(0,
          DataEntity(one: one, two: two, dateTime: DateTime.parse(dateTime)));
    }
    return dataList;
  }
}
