import 'dart:convert';

import 'package:afs_mock_project/config/environment.dart';
import 'package:afs_mock_project/models/items_model.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ItemRepository {
  final List<ItemModel> _items = [];
  final _uuid = Uuid();
  final String baseUrl = Environment.baseUrl;

  Future<List<ItemModel>> getItems() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => ItemModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<ItemModel> createItem(String name, String description) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"id": _uuid, "name": name, "description": description}),
    );

    if (response.statusCode == 201) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<ItemModel> updateItem(ItemModel item) async {
    final response = await http.put(Uri.parse('$baseUrl/${item.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(item.toJson()));

    if (response.statusCode == 200) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItem(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete item');
    }
  }
}
