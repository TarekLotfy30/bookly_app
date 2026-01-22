import 'package:hive_flutter/hive_flutter.dart';

/// A comprehensive helper class for Hive local storage operations
///
/// Usage:
/// 1. Initialize in main(): await HiveHelper.init();
/// 2. Register adapters: HiveHelper.registerAdapter(YourModelAdapter());
/// 3. Open boxes: await HiveHelper.openBox<YourModel>('boxName');
/// 4. Use CRUD operations with the helper methods
class HiveHelper {
  HiveHelper._();

  // static const String _defaultBox = 'appBox';

  /// Initialize Hive with Flutter support
  /// Call this in main() before runApp()
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Register a type adapter for custom objects
  /// Example: HiveHelper.registerAdapter(PersonAdapter());
  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// Open a box with a specific name
  static Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return Hive.openBox<T>(boxName);
  }

  /// Get an opened box
  static Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Check if a box is open
  static bool isBoxOpen(String boxName) {
    return Hive.isBoxOpen(boxName);
  }

  // ==================== CRUD Operations ====================

  /// Save a single value with a key
  static Future<void> put<T>({
    required String key,
    required T value,
    required String boxName,
  }) async {
    final box = await openBox<T>(boxName);
    await box.put(key, value);
  }

  /// Get a value by key
  static T? get<T>({
    required String key,
    required String boxName,
    T? defaultValue,
  }) {
    if (!isBoxOpen(boxName)) {
      return defaultValue;
    }
    final box = Hive.box<T>(boxName);
    return box.get(key, defaultValue: defaultValue);
  }

  /// Delete a value by key
  static Future<void> delete({
    required String key,
    required String boxName,
  }) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  /// Check if a key exists
  static bool containsKey({required String key, required String boxName}) {
    if (!isBoxOpen(boxName)) {
      return false;
    }
    final box = Hive.box(boxName);
    return box.containsKey(key);
  }

  /// Add a value to the box (auto-incrementing key)
  static Future<int> add<T>({required T value, required String boxName}) async {
    final box = await openBox<T>(boxName);
    return box.add(value);
  }

  /// Add all values to the box
  static Future<Iterable<int>> addAll<T>({
    required List<T> values,
    required String boxName,
  }) async {
    final box = await openBox<T>(boxName);
    return box.addAll(values);
  }

  /// Put all key-value pairs
  static Future<void> putAll<T>({
    required Map<String, T> entries,
    required String boxName,
  }) async {
    final box = await openBox<T>(boxName);
    await box.putAll(entries);
  }

  /// Get all values from a box
  static List<T> getAll<T>({required String boxName}) {
    if (!isBoxOpen(boxName)) {
      return [];
    }
    final box = Hive.box<T>(boxName);
    return box.values.toList();
  }

  /// Get all keys from a box
  static List<dynamic> getAllKeys({required String boxName}) {
    if (!isBoxOpen(boxName)) {
      return [];
    }
    final box = Hive.box(boxName);
    return box.keys.toList();
  }

  /// Get value at specific index
  static T? getAt<T>({required int index, required String boxName}) {
    if (!isBoxOpen(boxName)) {
      return null;
    }
    final box = Hive.box<T>(boxName);
    if (index >= box.length) {
      return null;
    }
    return box.getAt(index);
  }

  /// Put value at specific index
  static Future<void> putAt<T>({
    required int index,
    required T value,
    required String boxName,
  }) async {
    final box = await openBox<T>(boxName);
    await box.putAt(index, value);
  }

  /// Delete value at specific index
  static Future<void> deleteAt({
    required int index,
    required String boxName,
  }) async {
    final box = await openBox(boxName);
    await box.deleteAt(index);
  }

  /// Clear all data in a box
  static Future<void> clear({required String boxName}) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  /// Get the length of a box
  static int length({required String boxName}) {
    if (!isBoxOpen(boxName)) {
      return 0;
    }
    final box = Hive.box(boxName);
    return box.length;
  }

  /// Check if box is empty
  static bool isEmpty({required String boxName}) {
    return length(boxName: boxName) == 0;
  }

  // ==================== Box Management ====================

  /// Close a specific box
  static Future<void> closeBox(String boxName) async {
    if (isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  /// Close all open boxes
  static Future<void> closeAllBoxes() async {
    await Hive.close();
  }

  /// Delete a box from disk
  static Future<void> deleteBox(String boxName) async {
    if (isBoxOpen(boxName)) {
      await Hive.box(boxName).deleteFromDisk();
    } else {
      await Hive.deleteBoxFromDisk(boxName);
    }
  }

  /// Compact a box (reduces file size)
  static Future<void> compact({required String boxName}) async {
    final box = await openBox(boxName);
    await box.compact();
  }

  // ==================== Watch/Listen ====================

  /// Watch for changes in a box
  static Stream<BoxEvent> watch({required String boxName, dynamic key}) {
    final box = Hive.box(boxName);
    return box.watch(key: key);
  }

  // ==================== Encrypted Box ====================

  /// Open an encrypted box (requires hive and encryption key)
  static Future<Box<T>> openEncryptedBox<T>({
    required String boxName,
    required List<int> encryptionKey,
  }) async {
    if (isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    return Hive.openBox<T>(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
  }

  // ==================== Utility Methods ====================

  /// Delete multiple keys
  static Future<void> deleteKeys({
    required List<String> keys,
    required String boxName,
  }) async {
    final box = await openBox(boxName);
    await box.deleteAll(keys);
  }

  /// Get values for multiple keys
  static Map<String, T?> getMultiple<T>({
    required List<String> keys,
    required String boxName,
  }) {
    if (!isBoxOpen(boxName)) {
      return {};
    }
    final box = Hive.box<T>(boxName);
    return {for (final key in keys) key: box.get(key)};
  }

  /// Check if box exists on disk
  static Future<bool> boxExists(String boxName) async {
    return Hive.boxExists(boxName);
  }
}

// ==================== Example Usage ====================

/*
// 1. In main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();
  await HiveHelper.openBox('settings');
  runApp(MyApp());
}

// 2. Simple key-value storage
await HiveHelper.put(key: 'username', value: 'John', boxName: 'settings');
String? username = HiveHelper.get<String>(key: 'username', boxName: 'settings');

// 3. Store objects (with adapter)
class Person {
  final String name;
  final int age;
  Person(this.name, this.age);
}

// Register adapter
HiveHelper.registerAdapter(PersonAdapter());
await HiveHelper.openBox<Person>('people');

// Store person
await HiveHelper.put(key: 'person1', value: Person('Alice', 30), boxName: 'people');

// Get person
Person? person = HiveHelper.get<Person>(key: 'person1', boxName: 'people');

// 4. List operations
await HiveHelper.add(value: Person('Bob', 25), boxName: 'people');
List<Person> allPeople = HiveHelper.getAll<Person>(boxName: 'people');

// 5. Watch for changes
HiveHelper.watch(boxName: 'settings', key: 'username').listen((event) {
  print('Username changed to: ${event.value}');
});

// 6. Clear data
await HiveHelper.clear(boxName: 'settings');
*/
