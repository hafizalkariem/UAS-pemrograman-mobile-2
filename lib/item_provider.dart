import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'item.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  ItemProvider() {
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final db = DatabaseHelper.instance;
    _items = await db.getAllItems();
    notifyListeners();
  }

  Future<void> addItem(Item item) async {
    final db = DatabaseHelper.instance;
    await db.insertItem(item);
    _fetchItems();
  }

  Future<void> updateItem(Item item) async {
    final db = DatabaseHelper.instance;
    await db.updateItem(item);
    _fetchItems();
  }

  Future<void> deleteItem(int id) async {
    final db = DatabaseHelper.instance;
    await db.deleteItem(id);
    _fetchItems();
  }
}
