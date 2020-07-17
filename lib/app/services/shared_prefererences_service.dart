import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_interface.dart';

class SharedPreferencesService implements ILocalStorage {
  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  SharedPreferencesService() {
    _init();
  }

  void _init() async {
    _instance.complete(await SharedPreferences.getInstance());
  }

  Future<bool> contains(String key) async {
    final shared = await _instance.future;
    return shared.containsKey(key);
  }

  Future getData(String key) async {
    final shared = await _instance.future;
    return shared.get(key);
  }

  Future<Set<String>> getKeys() async {
    final shared = await _instance.future;
    return shared.getKeys();
  }

  @override
  Future<bool> delete(String key) async {
    final shared = await _instance.future;
    return shared.remove(key);
  }

  @override
  Future<List<String>> getAll(String key) async {
    final shared = await _instance.future;
    return shared.getStringList(key);
  }

  @override
  Future<bool> put(String key, List<String> value) async {
    final shared = await _instance.future;
    return shared.setStringList(key, value);
  }
}
