import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_beautiful_checklist_exercise/shared/database_repository.dart';

class SharedPreferencesRepository implements DatabaseRepository {
  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  List<String> _items = [];

  @override
  Future<void> addItem(String item) async {
    _items.add(item);
    await _saveItem();
  }

  @override
  Future<void> deleteItem(int index) async {
    _items.removeAt(index);
    await _saveItem();
  }

  @override
  Future<void> editItem(int index, String newItem) async {
    _items[index] = newItem;
    await _saveItem();
  }

  // Functions
  @override
  Future<List<String>> getItems() async {
    _items = await prefs.getStringList('checklist') ?? [];
    return _items;
  }

  @override
  // TODO: implement itemCount
  Future<int> get itemCount => _getItemCount();

  Future<int> _getItemCount() async {
    return _items.length;
  }

  Future<void> _saveItem() async {
    await prefs.setStringList("checklist", _items);
  }
}
