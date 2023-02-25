import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MySql {
  static Database? database;

  Future<Database?> getDatabase() async {
    if (database == null) {
      database = await createDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> createDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'passwords.db');
    Database myDatabase = await openDatabase(
        path,
        version: 1,
        onCreate: onCreate,
        onOpen: (Database database) {
          print("database Opened");
        }
    );
    return myDatabase;
  }

  Future<void> onCreate(Database database, int version) async {
    await onCreatePasswords(database, version);
    await onCreateNotes(database, version);
  }

  Future<void> onCreatePasswords(Database database, int version) async {
    await database.execute(
        '''CREATE TABLE passwords ("id" INTEGER PRIMARY KEY NOT NULL,"category" TEXT, "email" TEXT,"password" TEXT,"status" TEXT)''');
    print("passwords tablePasswords created");
  }

  Future<void> onCreateNotes(Database database, int version) async {
    await database.execute(
        '''CREATE TABLE notes ("id" INTEGER PRIMARY KEY NOT NULL,"category" TEXT, "Note" TEXT,"status" TEXT)''');
    print("notes table created");
  }

  Future<List<Map>> getData(String sql) async {
    Database? myDatabase = await getDatabase();
    List<Map> response = await myDatabase!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String sql) async {
    Database? myDatabase = await getDatabase();
    int response = await myDatabase!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String sql) async {
    Database? myDatabase = await getDatabase();
    int response = await myDatabase!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(String sql) async {
    Database? myDatabase = await getDatabase();
    int response = await myDatabase!.rawDelete(sql);
    return response;
  }
}
