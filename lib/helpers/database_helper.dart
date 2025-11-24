import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user.dart';
import '../models/purchase.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cinema_booking.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullName TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        address TEXT NOT NULL,
        phoneNumber TEXT NOT NULL,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE purchases(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER NOT NULL,
        movieId INTEGER NOT NULL,
        movieTitle TEXT NOT NULL,
        moviePoster TEXT NOT NULL,
        movieSchedule TEXT NOT NULL,
        buyerName TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        purchaseDate TEXT NOT NULL,
        totalPrice REAL NOT NULL,
        paymentMethod TEXT NOT NULL,
        cardNumber TEXT,
        status TEXT NOT NULL,
        FOREIGN KEY (userId) REFERENCES users (id)
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(String emailOrUsername, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: '(email = ? OR username = ?) AND password = ?',
      whereArgs: [emailOrUsername, emailOrUsername, password],
    );
    if (results.isNotEmpty) {
      return User.fromMap(results.first);
    }
    return null;
  }

  Future<bool> isEmailExists(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return results.isNotEmpty;
  }

  Future<bool> isUsernameExists(String username) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return results.isNotEmpty;
  }

  Future<int> insertPurchase(Purchase purchase) async {
    Database db = await database;
    return await db.insert('purchases', purchase.toMap());
  }

  Future<List<Purchase>> getPurchasesByUserId(int userId) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'purchases',
      where: 'userId = ? AND status = ?',
      whereArgs: [userId, 'completed'],
      orderBy: 'id DESC',
    );
    return results.map((map) => Purchase.fromMap(map)).toList();
  }

  Future<Purchase?> getPurchaseById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      'purchases',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return Purchase.fromMap(results.first);
    }
    return null;
  }

  Future<int> updatePurchase(Purchase purchase) async {
    Database db = await database;
    return await db.update(
      'purchases',
      purchase.toMap(),
      where: 'id = ?',
      whereArgs: [purchase.id],
    );
  }

  Future<int> deletePurchase(int id) async {
    Database db = await database;
    return await db.delete('purchases', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    Database db = await database;
    db.close();
  }
}
