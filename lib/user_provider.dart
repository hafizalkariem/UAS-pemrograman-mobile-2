import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  UserProvider() {
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final db = DatabaseHelper.instance;
    _users = await db.getAllUsers();
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    await _fetchUsers();
  }

  Future<User?> getUserByUsername(String username) async {
    final db = DatabaseHelper.instance;
    return await db.getUserByUsername(username);
  }

  Future<void> addUser(User user) async {
    final db = DatabaseHelper.instance;
    await db.insertUser(user);
    _fetchUsers();
  }

  Future<void> updateUser(User user) async {
    final db = DatabaseHelper.instance;
    await db.updateUser(user);
    _fetchUsers();
  }

  Future<void> deleteUser(int id) async {
    final db = DatabaseHelper.instance;
    await db.deleteUser(id);
    _fetchUsers();
  }
}
